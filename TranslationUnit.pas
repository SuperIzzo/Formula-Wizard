unit TranslationUnit;

interface
uses INIFiles,SysUtils;

type
  TLangFile=record
    name:string;
    path:string;
    end;

var
  TransIni:TIniFile;
  done:boolean;
  langs:array of TLangFile;

  procedure InitTrans(fname:string);
  function  GetWord(key,tr:string):string;
  function  GetLangName(path:string):string;
  procedure ChangeLanguage(fname:string);
  procedure OtherTran;

  procedure ScanLanguages;


implementation

uses DesktopUnit,EditDlgUnit,Unit4,FormulaCalculatorUnit,FormulaChartUnit,FormulaEditUnit,FormulaExpressUnit,FormulasUnit,QuantitiesUnit,
QuantitiesDervUnit,QuantitiesEditUnit,QuantitiesTransUnit,SettingsUnit,UnitsUnit,UnitsDervUnit,UnitsEditUnit,UnitsTransUnit,EExpr,ImportPackageUnit;

procedure InitTrans(fname:string);
begin
  if done then exit;
  if TransIni<>nil then TransIni.Free;
  TransIni := TIniFile.Create(fname);
  done:=true;

  OtherTran
  
end;

function GetWord(key,tr:string):string;
begin
  result:=tr;
  if not done then exit; 
  Result:=TransIni.ReadString('Language',key,tr);
end;

function  GetLangName(path:string):string;
var ti:TIniFile;
begin
  Result:='';
  if not FileExists(path) then exit;
  ti := TIniFile.Create(path);
  Result:=ti.ReadString('Language','Lang',' ');
  ti.Free;
end;

procedure ChangeLanguage(fname:string);
begin
  if TransIni<>nil then TransIni.Free;
  TransIni := TIniFile.Create(fname);
  done:=true;

  OtherTran

end;

Procedure OtherTran;
begin
  Desktop.translate_form;
  EditDlg.translate_form;
  Form4.translate_form;
  FormulaCalculatorBox.translate_form;
  FormulaChartBox.translate_form;
  FormulaEditBox.translate_form;
  FormulaExpressBox.translate_form;
  Formulas.translate_form;
  Quantities.translate_form;
  QuantitiesDervBox.translate_form;
  QuantitiesEditBox.translate_form;
  QuantitiesTransBox.translate_form;
  SettingsBox.translate_form;
  Units.translate_form;
  UnitsDervBox.translate_form;
  UnitsEditBox.translate_form;
  UnitsTransBox.translate_form;
  EExpr.translate;
  ImportPackageBox.translate_form;
end;  

procedure ScanLanguages;
var sr:TSearchRec;
    code:integer;
begin
  code:=FindFirst(working_directory+'\Languages\*.*',0,sr);
  SetLength(langs,0);
  while (sr.Name<>'') and (code=0) do
  begin
    SetLength(langs,High(langs)+2);
    langs[High(langs)].path:=working_directory+'\Languages\'+sr.Name;
    langs[High(langs)].name:=GetLangName(working_directory+'\Languages\'+sr.Name);
    code:=FindNext(sr);
  end;
end;

end.
