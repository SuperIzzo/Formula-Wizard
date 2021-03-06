unit Packages;

interface

uses SysUtils,FormulasUnit,QuantitiesUnit,UnitsUnit;

type

  DataTypes=(dtNone=-1,dtFormula=0,dtQuantity=1,dtUnit=2);
  FileMode=(fmOpenRead=0,fmOpenWrite=1,fmOpenCreate=2);

  PPackData=^TPackData;
  TPackData=Record
    DType:DataTypes;
    Name:String;
    CUse:String;
    Sign:String;
    Main:String;
    Formula:String;
    Description:String;
  end;

  PPackDataList=^TPackDataList;
  TPackDataList=Array of TPackData;

  TPack=Object

    procedure OpenPackageFile(fname:string;fmode:FileMode);
    procedure ClosePackageFile;
    procedure ReadUp;
    procedure AddDataStr(DataType:DataTypes;arg1,arg2,arg3,arg4,arg5:string);
    procedure AddData(Data:TPackData);
    function  NewDataField:integer;
    function  LastDataField:integer;
    procedure AddToDataBase(index:integer);
    procedure AddToDataBaseDirect(Data:TPackData);
    procedure SelectAll;
    procedure SelectNone;
    procedure SelectResize;
    procedure Clear;
    procedure ImportAll;
    function  ImportSelected:Boolean;
    function  IsSelected(index:integer):Boolean;
    procedure SetSelected(index:integer;checked:boolean);
    procedure WriteSelected;
    procedure WriteData(index:integer);
    procedure WriteAll;
    procedure LoadFormulas;
    procedure LoadQuantities;
    procedure LoadUnits;
    procedure LoadDataBase;

    constructor Create;
    destructor  Destroy;

    public
      DataFileName:string;
      PackageFile:Text;
      DataList:TPackDataList;
      Selected:Array of Boolean;
      
    private
      Mode:FileMode;
      opened:boolean;
  end;

implementation
  procedure TPack.OpenPackageFile(fname:string;fmode:FileMode);
  var fe:boolean;
  begin

    fe:=FileExists(fname);

    If (fe) or (fmode<>fmOpenRead) then
    begin
      DataFileName:=fname;
      Mode:=fmode;

      AssignFile(PackageFile,DataFileName);
      case Mode of
        fmOpenRead   : Reset(PackageFile);
        fmOpenWrite  : if fe then Reset(PackageFile) else Rewrite(PackageFile);
        fmOpenCreate : Rewrite(PackageFile);
      end;
      opened:=true;

    end;
  end;

  procedure TPack.ClosePackageFile;
  begin
    if opened then
    begin
      DataFileName:='';
      Close(PackageFile);
      opened:=false;
    end;
  end;

  function  TPack.NewDataField:integer;
  var num:integer;
  begin
    num:=High(DataList)+1;
    SetLength(DataList,num+1);
    DataList[num].DType:=dtNone;
    DataList[num].Name:='';
    DataList[num].CUse:='';
    DataList[num].Sign:='';
    DataList[num].Main:='';
    DataList[num].Formula:='';
    DataList[num].Description:='';
    Result:=num;
  end;

  function  TPack.LastDataField;
  begin
    Result:=High(DataList);
  end;  

  procedure TPack.ReadUp;
  var line:string;
      num:integer;
  begin
    num:=-1;
    if not opened then exit;

    while not eof(PackageFile) do
    begin
      Readln(PackageFile,line);

      if pos('FORMULA:',UpperCase(line))>=1 then
      begin
        num:=NewDataField;
        DataList[num].DType:=dtFormula;
      end;

      if pos('QUANTITY:',UpperCase(line))>=1 then
      begin
        num:=NewDataField;
        DataList[num].DType:=dtQuantity;
      end;

      if pos('UNIT:',UpperCase(line))>=1 then
      begin
        num:=NewDataField;
        DataList[num].DType:=dtUnit;
      end;

      if pos('NAME=',UpperCase(line))>=1 then
      begin
        DataList[num].Name:=Copy(line,pos('NAME=',UpperCase(line))+5,Length(line));
      end;

      if pos('CASE=',UpperCase(line))>=1 then
      begin
        DataList[num].CUse:=Copy(line,pos('CASE=',UpperCase(line))+5,Length(line));
      end;

      if pos('SIGN=',UpperCase(line))>=1 then
      begin
        DataList[num].Sign:=Copy(line,pos('SIGN=',UpperCase(line))+5,Length(line));
      end;

      if pos('MAIN=',UpperCase(line))>=1 then
      begin
        DataList[num].Main:=Copy(line,pos('MAIN=',UpperCase(line))+5,Length(line));
      end;

      if pos('FORMULA=',UpperCase(line))>=1 then
      begin
        DataList[num].Formula:=Copy(line,pos('FORMULA=',UpperCase(line))+8,Length(line));
      end;

      if pos('UNIT=',UpperCase(line))>=1 then
      begin
        DataList[num].Formula:=Copy(line,pos('UNIT=',UpperCase(line))+5,Length(line));
      end;

      if pos('DESCRIPTION=',UpperCase(line))>=1 then
      begin
        DataList[num].Description:=Copy(line,pos('DESCRIPTION=',UpperCase(line))+12,Length(line));
      end;

      if pos('DESC=',UpperCase(line))>=1 then
      begin
        DataList[num].Description:=Copy(line,pos('DESC=',UpperCase(line))+5,Length(line));
      end;

    end;
  end;

  procedure TPack.AddDataStr(DataType:DataTypes;arg1,arg2,arg3,arg4,arg5:string);
  var num:integer;
  begin
    num:=NewDataField;
    DataList[num].DType:=DataType;

    Case DataType of
        dtFormula:
          begin
            DataList[num].Name:=arg1;
            DataList[num].Formula:=arg2;
            DataList[num].CUse:=arg3;
            DataList[num].Description:=arg4;
          end;
        dtQuantity:
          begin
            DataList[num].Name:=arg1;
            DataList[num].Sign:=arg2;
            DataList[num].Formula:=arg3;
            DataList[num].Description:=arg4;
          end;
        dtUnit:
          begin
            DataList[num].Name:=arg1;
            DataList[num].Sign:=arg2;
            DataList[num].Main:=arg3;
            DataList[num].Formula:=arg4;
            DataList[num].Description:=arg5;
          end;
    end;
  end;

  procedure TPack.AddData(Data:TPackData);
  var num:integer;
  begin
    num:=NewDataField;
    DataList[num]:=Data;
  end;

  procedure TPack.AddToDataBase(index:integer);
  begin
    if (index<0) or (index>LastDataField) then exit;
    Case DataList[index].DType of
          dtFormula:
            begin
              Formulas.ADOTable1.insert;
              Formulas.ADOTable1.FieldbyName('Name').value:=DataList[index].Name;
              Formulas.ADOTable1.FieldbyName('Case').value:=DataList[index].CUse;
              Formulas.ADOTable1.FieldByName('Formula').value:=DataList[index].Formula;
              Formulas.ADOTable1.FieldByName('Description').value:=DataList[index].Description;
              Formulas.ADOTable1.post;
            end;
          dtQuantity:
            begin
              Quantities.ADOTable1.Insert;
              Quantities.ADOTable1.FieldbyName('Name').value:=DataList[index].Name;
              Quantities.ADOTable1.FieldByName('Short').value:=DataList[index].Sign;
              Quantities.ADOTable1.FieldByName('Unit').value:=DataList[index].Formula;
              Quantities.ADOTable1.FieldByName('Description').value:=DataList[index].Formula;
              Quantities.ADOTable1.Post;
            end;
          dtUnit:
            begin
              Units.ADOTable1.Insert;
              Units.ADOTable1.FieldbyName('Name').value:=DataList[index].Name;
              Units.ADOTable1.FieldByName('Short').value:=DataList[index].Sign;;
              Units.ADOTable1.FieldByName('Formula').value:=DataList[index].Formula;
              Units.ADOTable1.FieldByName('Main').value:=DataList[index].Main;
              Units.ADOTable1.FieldByName('Description').value:=DataList[index].Description;
              Units.ADOTable1.Post;
            end;
    end;
  end;

  procedure TPack.AddToDataBaseDirect(Data:TPackData);
  begin
    Case Data.DType of
          dtFormula:
            begin
              Formulas.ADOTable1.insert;
              Formulas.ADOTable1.FieldbyName('Name').value:=Data.Name;
              Formulas.ADOTable1.FieldbyName('Case').value:=Data.CUse;
              Formulas.ADOTable1.FieldByName('Formula').value:=Data.Formula;
              Formulas.ADOTable1.FieldByName('Description').value:=Data.Description;
              Formulas.ADOTable1.post;
            end;
          dtQuantity:
            begin
              Quantities.ADOTable1.Insert;
              Quantities.ADOTable1.FieldbyName('Name').value:=Data.Name;
              Quantities.ADOTable1.FieldByName('Short').value:=Data.Sign;
              Quantities.ADOTable1.FieldByName('Unit').value:=Data.Formula;
              Quantities.ADOTable1.FieldByName('Description').value:=Data.Formula;
              Quantities.ADOTable1.Post;
            end;
          dtUnit:
            begin
              Units.ADOTable1.Insert;
              Units.ADOTable1.FieldbyName('Name').value:=Data.Name;
              Units.ADOTable1.FieldByName('Short').value:=Data.Sign;;
              Units.ADOTable1.FieldByName('Formula').value:=Data.Formula;
              Units.ADOTable1.FieldByName('Main').value:=Data.Main;
              Units.ADOTable1.FieldByName('Description').value:=Data.Description;
              Units.ADOTable1.Post;
            end;
    end;
  end;

  procedure TPack.SelectAll;
  var num,i:integer;
  begin
    num:=LastDataField;
    SetLength(Selected,num+1);
    For i:=0 to num do
      Selected[i]:=True;
  end;

  procedure TPack.SelectNone;
  var num,i:integer;
  begin
    num:=LastDataField;
    SetLength(Selected,num+1);
    For i:=0 to num do
      Selected[i]:=false;
  end;

  procedure TPack.SelectResize;
  begin
    SetLength(Selected,LastDataField+1);
  end;

  constructor TPack.Create;
  begin
    self.DataFileName:='';
    self.opened:=false;
    SetLength(DataList,0);
    SetLength(Selected,0);
  end;

  destructor TPack.Destroy;
  begin
    self.DataFileName:='';
    self.opened:=false;
    SetLength(DataList,0);
    SetLength(Selected,0);
  end;

  procedure TPack.Clear;
  begin
    SetLength(DataList,0);
    SetLength(Selected,0);
  end;

  procedure TPack.ImportAll;
  var i:integer;
  begin
    For i:=0 to LastDataField do
      AddToDataBase(i);
  end;

  function TPack.ImportSelected:boolean;
  var i:integer;
  begin
    Result:=false;
    For i:=0 to LastDataField do
      if IsSelected(i) then begin Result:=true; AddToDataBase(i);end;
  end;

  function  TPack.IsSelected(index:integer):Boolean;
  begin
    if Index>High(Selected) then begin Result:=false; exit; end;
    if Index<0 then begin Result:=false; exit; end;
    if Selected[Index]=false then begin Result:=false; exit; end;
    Result:=true;
  end;  

  procedure TPack.SetSelected(index:integer;checked:boolean);
  begin
    if index>High(Selected) then SetLength(Selected,index+1);
    Selected[index]:=checked;
  end;  

  procedure TPack.WriteData(index:integer);
  begin
    if (index>LastDataField) or (index<0) or (not opened) then exit;
    Case DataList[index].DType of
      dtFormula:
        begin
          Writeln(PackageFile,'Formula:');
          Writeln(PackageFile,'  Name='+DataList[index].Name);
          Writeln(PackageFile,'  Formula='+DataList[index].Formula);
          Writeln(PackageFile,'  Case='+DataList[index].CUse);
          Writeln(PackageFile,'  Desc='+DataList[index].Description);
          Writeln(PackageFile);
        end;
      dtQuantity:
        begin
          Writeln(PackageFile,'Quantity:');
          Writeln(PackageFile,'  Name='+DataList[index].Name);
          Writeln(PackageFile,'  Sign='+DataList[index].Sign);
          Writeln(PackageFile,'  Unit='+DataList[index].Formula);
          Writeln(PackageFile,'  Desc='+DataList[index].Description);
          Writeln(PackageFile);
        end;
      dtUnit:
        begin
          Writeln(PackageFile,'Unit:');
          Writeln(PackageFile,'  Name='+DataList[index].Name);
          Writeln(PackageFile,'  Sign='+DataList[index].Sign);
          Writeln(PackageFile,'  Main='+DataList[index].Main);
          Writeln(PackageFile,'  Formula='+DataList[index].Formula);
          Writeln(PackageFile,'  Desc='+DataList[index].Description);
          Writeln(PackageFile);
        end;
    end;
  end;

  procedure TPack.WriteSelected;
  var i:integer;
  begin
    For i:=0 to LastDataField do
      if IsSelected(i) then begin WriteData(i);end;
  end;

  procedure TPack.WriteAll;
  var i:integer;
  begin
    For i:=0 to LastDataField do
      begin WriteData(i);end;
  end;

  procedure TPack.LoadFormulas;
  var book:string;
  begin
    book:=Formulas.ADOTable1.Bookmark;
    Formulas.ADOTable1.first;
    while not Formulas.ADOTable1.Eof do
    begin
      AddDataStr(dtFormula,
                 Formulas.ADOTable1.FieldbyName('Name').AsString,
                 Formulas.ADOTable1.FieldbyName('Formula').AsString,
                 Formulas.ADOTable1.FieldbyName('Case').AsString,
                 Formulas.ADOTable1.FieldbyName('Description').AsString,'');
    Formulas.ADOTable1.Next;
    end;
    Formulas.ADOTable1.Bookmark:=book;
  end;

  procedure TPack.LoadQuantities;
  var book:string;
  begin
    book:=Quantities.ADOTable1.Bookmark;
    Quantities.ADOTable1.first;
    while not Quantities.ADOTable1.Eof do
    begin
      AddDataStr(dtQuantity,
                 Quantities.ADOTable1.FieldbyName('Name').AsString,
                 Quantities.ADOTable1.FieldbyName('Short').AsString,
                 Quantities.ADOTable1.FieldbyName('Unit').AsString,
                 Quantities.ADOTable1.FieldbyName('Description').AsString,'');
    Quantities.ADOTable1.Next;
    end;
    Quantities.ADOTable1.Bookmark:=book;
  end;

  procedure TPack.LoadUnits;
  var book:string;
  begin
    book:=Units.ADOTable1.Bookmark;
    Units.ADOTable1.first;
    while not Units.ADOTable1.Eof do
    begin
      AddDataStr(dtUnit,
                 Units.ADOTable1.FieldbyName('Name').AsString,
                 Units.ADOTable1.FieldbyName('Short').AsString,
                 Units.ADOTable1.FieldbyName('Main').AsString,
                 Units.ADOTable1.FieldbyName('Formula').AsString,
                 Units.ADOTable1.FieldbyName('Description').AsString);
    Units.ADOTable1.Next;             
    end;
    Units.ADOTable1.Bookmark:=book;
  end;

  procedure TPack.LoadDataBase;
  begin
    self.LoadFormulas;
    self.LoadQuantities;
    self.LoadUnits;
  end;
    
end.
