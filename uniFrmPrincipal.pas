unit uniFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections,
  Vcl.OleCtrls, SHDocVw, ActiveX, ShellAPI;

type
  TRota = class
    public
      rota: array of array[0..1] of Integer;
  end;

type
  TfrmPrincipal = class(TForm)
    pnlMatriz: TPanel;
    edt11: TEdit;
    edt12: TEdit;
    edt13: TEdit;
    edt14: TEdit;
    edt21: TEdit;
    edt22: TEdit;
    edt23: TEdit;
    edt24: TEdit;
    edt31: TEdit;
    edt32: TEdit;
    edt33: TEdit;
    edt34: TEdit;
    edt41: TEdit;
    edt42: TEdit;
    edt43: TEdit;
    edt44: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblEx2: TLabel;
    lblEx3: TLabel;
    lblEx4: TLabel;
    lblEx5: TLabel;
    browserRespostas: TWebBrowser;
    lblEx1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure edt11Change(Sender: TObject);
    procedure lblEx2Click(Sender: TObject);
    procedure lblEx1MouseEnter(Sender: TObject);
    procedure lblEx1MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblEx1Click(Sender: TObject);
    procedure lblEx3Click(Sender: TObject);
    procedure lblEx4Click(Sender: TObject);
    procedure lblEx5Click(Sender: TObject);
  private
    vMatriz: array[0..3, 0..3] of Integer;
    procedure escreveResposta(pBody: TStringList);
    function traduzNomeCidade(codCidade: Integer): String;
  public
    procedure popularMatriz();
    procedure encontraRotas(pQtd: Integer; pCircuito: Boolean);
    procedure encontraMenorCaminho;
    procedure encontraCiclo;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  popularMatriz;
end;

procedure TfrmPrincipal.edt11Change(Sender: TObject);
begin
  if not(StrToInt(TEdit(Sender).Text) in [0,1]) then
    TEdit(Sender).Text := '0';
end;

procedure TfrmPrincipal.popularMatriz();
begin
  vMatriz[0,0] := StrToInt(edt11.Text);
  vMatriz[0,1] := StrToInt(edt21.Text);
  vMatriz[0,2] := StrToInt(edt31.Text);
  vMatriz[0,3] := StrToInt(edt41.Text);
  vMatriz[1,0] := StrToInt(edt12.Text);
  vMatriz[1,1] := StrToInt(edt22.Text);
  vMatriz[1,2] := StrToInt(edt32.Text);
  vMatriz[1,3] := StrToInt(edt42.Text);
  vMatriz[2,0] := StrToInt(edt13.Text);
  vMatriz[2,1] := StrToInt(edt23.Text);
  vMatriz[2,2] := StrToInt(edt33.Text);
  vMatriz[2,3] := StrToInt(edt43.Text);
  vMatriz[3,0] := StrToInt(edt14.Text);
  vMatriz[3,1] := StrToInt(edt24.Text);
  vMatriz[3,2] := StrToInt(edt34.Text);
  vMatriz[3,3] := StrToInt(edt44.Text);
end;

function TfrmPrincipal.traduzNomeCidade(codCidade: Integer): String;
begin
  case (codCidade) of
    00: Result := 'Jales';
    01: Result := 'Votuporanga';
    02: Result := 'Fernandópolis';
    03: Result := 'Sta. Fé';
  end;
end;

procedure TfrmPrincipal.encontraCiclo;
var
  i,j: Integer;
  vResposta: TStringList;
begin
  (* Menor caminho. *)
  popularMatriz;
  vResposta := TStringList.Create;
  try
    for i := 0 to 3 do
    for j := 0 to 3 do
    begin
      if ((vMatriz[i,j] = 1) and (i = j)) then
      begin
        vResposta.Add('<label class="titulo">Ciclo encontrado:</label></br>');
        vResposta.Add(Format('<label class="info">%s -> %s</label></br>', [traduzNomeCidade(i), traduzNomeCidade(j)]));
        escreveResposta(vResposta);
        Abort; (* Apenas um ciclo. *)
      end;
    end;
  finally
    vResposta.Free;
  end;
end;

procedure TfrmPrincipal.encontraMenorCaminho;
var
  i,j: Integer;
  vResposta: TStringList;
begin
  (* Menor caminho. *)
  popularMatriz;
  vResposta := TStringList.Create;
  try
    for i := 0 to 3 do
    begin
      for j := 0 to 3 do
      begin
        if ((vMatriz[i,j] = 1) and (i = j)) then
        begin
          vResposta.Add('<label class="titulo">Menor caminho encontrado:</label></br>');
          vResposta.Add(Format('<label class="info">%s -> %s</label></br>', [traduzNomeCidade(i), traduzNomeCidade(j)]));
        end;
      end;
    end;
  finally
    escreveResposta(vResposta);
    vResposta.Free;
  end;
end;

procedure TfrmPrincipal.encontraRotas(pQtd: Integer; pCircuito: Boolean);
var
  vAuxIn, vAuxOut, x: Integer;
  vAuxRota: TRota;
  vRota: TRota;
  pPararCircuito: Boolean;
  vRotasEncontradas: TObjectList<TRota>;
  vPrimeiraRota: array[0..1] of Integer;
  vContadorRotas: Integer;
  vInicioDestino: Integer;
  vStrList: TStringList;

  function encontraCaminho(inP1, inP2: Integer; pCircuito: Boolean; var outP1, outP2: Integer; var pParar: Boolean): Boolean;
  var
    i, j, x: Integer;
    vOrigemRepetida: Boolean;
  begin
    (* Posiciona o ponteiro em [inP1, inP2] e procura o proximo caminho. *)
    Result := False;
    pParar := False;
    for i := inP1 to 3 do
    begin
      for j := inP2 to 3 do
      begin
        if ((vMatriz[i,j] = 0) or (i = j)) then
          Continue;
        (* Antes de inserir no vetor, verifica se não existe nenhum destino igual à origem. *)
        vOrigemRepetida := False;
        if (Length(vRota.rota) > 0) then
          for x := 0 to High(vRota.rota) do
            if (vRota.rota[x][0] = j) then
            begin
              vOrigemRepetida := True;
              Break;
            end;
        if (vOrigemRepetida) then
        begin
          if (pCircuito) then
            pParar := True
          else
            Continue;
        end;

        outP1 := i;
        outP2 := J;
        vInicioDestino := 0;
        Result := True;
        Exit;
      end;
      if (vOrigemRepetida) then
        Exit;
    end;
  end;

  procedure adicionaARota(p1,p2: Integer);
  var
    x,y: Integer;
    b: Boolean;
  begin
    (* Se for a primeira rota, grava para começar a proxima. *)
    if (Length(vRota.rota) = 0) then
    begin
      if (p1 >= 3) then
      begin
        x := 0;
        y := 0;
      end else
        if (p2 >= 3) then
        begin
          x := p1 + 1;
          y := 0;
        end else
        begin
          x := p1;
          y := p2 + 1;
        end;

        if (encontraCaminho(x, y, False, x, y, b)) then
        begin
          vPrimeiraRota[0] := x;
          vPrimeiraRota[1] := y;
        end;
    end;

    (* Grava a rota no array. *)
    SetLength(vRota.rota, Length(vRota.rota)+ 1);
    vRota.rota[Pred(Length(vRota.rota))][0] := p1;
    vRota.rota[Pred(Length(vRota.rota))][1] := p2;
  end;
begin
  popularMatriz;
  (* Encontra x rotas possíveis. *)
  vRotasEncontradas := TObjectList<TRota>.Create();
  vPrimeiraRota[0] := 0;
  vPrimeiraRota[1] := 0;
  vAuxIn := 0;
  vAuxOut := 0;

  vContadorRotas := 1;
  while (vContadorRotas <= pQtd) do
  begin
    vRota := TRota.Create;
    vAuxOut := vPrimeiraRota[0];
    vInicioDestino := vPrimeiraRota[1];
    while (True) do
    begin
      if (encontraCaminho(vAuxOut, vInicioDestino, pCircuito, vAuxIn, vAuxOut, pPararCircuito)) then
      begin
        adicionaARota(vAuxIn, vAuxOut);
        if (pPararCircuito) then
          Break;
      end else
        Break;
    end;
    vRotasEncontradas.Add(vRota);
    Inc(vContadorRotas);
  end;

  vStrList := TStringList.Create;
  for vAuxRota in vRotasEncontradas do
  begin
    vStrList.Add('<label class="titulo">Rota encontrada:</label></br>');
    for x := Low(vAuxRota.rota) to High(vAuxRota.rota) do
      vStrList.Add(Format('<label class="info">%s -> %s</label></br>', [traduzNomeCidade(vAuxRota.rota[x][0]), traduzNomeCidade(vAuxRota.rota[x][1])]));
  end;
  escreveResposta(vStrList);
  vStrList.Free;
end;

procedure TfrmPrincipal.lblEx2Click(Sender: TObject);
begin
  encontraRotas(6, False);
end;

procedure TfrmPrincipal.lblEx3Click(Sender: TObject);
begin
  encontraMenorCaminho;
end;

procedure TfrmPrincipal.lblEx4Click(Sender: TObject);
begin
  encontraRotas(2, True);
end;

procedure TfrmPrincipal.lblEx5Click(Sender: TObject);
begin
  encontraCiclo;
end;

procedure TfrmPrincipal.lblEx1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/AndreAngelucci/pGrafosDelphi', '', '', 1);
end;

procedure TfrmPrincipal.lblEx1MouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Style := [fsUnderline];
end;

procedure TfrmPrincipal.lblEx1MouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Style := [];
end;

procedure TfrmPrincipal.escreveResposta(pBody: TStringList);
var
  vHTML: TStringList;
  vIndex: Integer;
  vStream: TMemoryStream;
  vLogoUnifev: TStringList;
begin
  (* Escreve a resposta no browser. *)
  vHTML := TStringList.Create;
  vHTML.Add('<!DOCTYPE HTML>');
  vHTML.Add('<style>');
  vHTML.Add('html{');
  vHTML.Add(' padding: 5px;');
  vHTML.Add('	background-color: rgb(62, 62, 64);');
  vHTML.Add('	font-family: "Ubuntu Mono", "Courier New";');
  vHTML.Add('}');
  vHTML.Add('div {');
  vHTML.Add('	width:100%;');
  vHTML.Add('}');
  vHTML.Add('.info{');
  vHTML.Add('	color: white;');
  vHTML.Add('}');
  vHTML.Add('.titulo{');
  vHTML.Add('	color: rgb(148, 215, 83);');
  vHTML.Add('}');
  vHTML.Add('.logo{');
  vHTML.Add('	color: red;');
  vHTML.Add('	font-size: 6px;');
  vHTML.Add('}');
  vHTML.Add('.cabecalho{');
  vHTML.Add('	color: red;');
  vHTML.Add('}');
  vHTML.Add('</style>');
  vHTML.Add('<html lang="pt-br">');
  vHTML.Add('	<head>');
  vHTML.Add('   <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">');
  vHTML.Add('		<link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono" rel="stylesheet">');
  vHTML.Add('	</head>');
  vHTML.Add('	<body>');
  vHTML.Add('	<div class="logo">');
  vLogoUnifev := TStringList.Create;
  vLogoUnifev.Add('                                                                                       .:7Juuu2;                                                                                                                                             </br>');
  vLogoUnifev.Add('                                                                                     sMBBBBBBBBF                                                                                                                                             </br>');
  vLogoUnifev.Add('                                                                                   SBBBBBBBBEr,                                                                                                                                              </br>');
  vLogoUnifev.Add('                                                                     ,:.          ZBBBBMRBX                                                                                                                                                  </br>');
  vLogoUnifev.Add('                                                                   cWOMME;       :BBMOOOMX                                                                                                                                                   </br>');
  vLogoUnifev.Add('                                                                  1Oc::7HBi      XBMOOOOB;                                                                                                                                                   </br>');
  vLogoUnifev.Add('                                                                  03:  ,rDF      BBROOOOBr                                                                                                                                                   </br>');
  vLogoUnifev.Add('                                                                  .1Jr;7UU       MBOOOORB7                                                                                                                                                   </br>');
  vLogoUnifev.Add('                                                                    .rr;         MBOOOORBr                  .,:::.                                                                                                                           </br>');
  vLogoUnifev.Add('     JBBBBBBBM       BBBBBBBB1      BBBBBBBB   :XBBBBBBBu         rv.    ;u      RBOOOORBM0OORM.        rKBBBBBBBBBBDi     .BBBBBBBBR       .BBBBBBBr                                                                                        </br>');
  vLogoUnifev.Add('     PBBBBBBBB       BBBBBBBBM      BBBBBBBB .BBBBBBBBBBBBx       ZBBBBBBBB      MBOOOORBBBBBBB:      KBBBBBBBBBBBBBBBB7    7BBBBBBBBW      BBBBBBBM                                                                                         </br>');
  vLogoUnifev.Add('     sBBBBBBBB       BBBBBBBBK      BBBBBBBBHBBBBBBBMBBBBBB7      3BBBBBBBB      MBOOOORMBBBBBB,    7BBBBBBBBBMMBBBBBBBB0    sBBBBBBBB7    FBBBBBBD                                                                                          </br>');
  vLogoUnifev.Add('     7BROOOOBB       BBOOOORBX      BBOOOOMBBBBBBBBMROORMBBB      sBBMMRRBB      MBOOOOOOOWRMBB,   2BBBMOBM;      3BBBBBBs    HBMOORBBB.  ;BBROOBR                                                                                           </br>');
  vLogoUnifev.Add('     7BROOOOBB       BBOOOOOBX      BBOOOORRMM:   iBBOOOOMBB.     cBROOOOBM      MBOOOOOB,        rBBMOOMF         ;BMMBBB     MBROOMBBB  BBROORB                                                                                            </br>');
  vLogoUnifev.Add('     7BROOOOBB       BBOOOORBX      BBOOOOOOB      7BROOOOBB.     cBROOOOBB      MBOOOOOB:        BBROOOB           BMRMBBr     BBROOMBBOEBMOOOB.                                                                                            </br>');
  vLogoUnifev.Add('     7BROOOOBB       BBOOOORBX      BBOOOOOBH      ,BMOOOOMB.     cBROOOOBB      MBOOOOOBr       ;BBOOOOBBBBBBBBBBBBBBBBBBi      BBRORBBBBROOOB:                                                                                             </br>');
  vLogoUnifev.Add('     7BROOOOBB       BBOOOORBX      BBOOOOOB1      ,BMOOOOMB.     cBROOOOBB      MBOOOORB7       rBMOOORBBBBBBBBBBOKF3uuU1       :BBOORMRROOOBr                                                                                              </br>');
  vLogoUnifev.Add('     7BROOOOBB       BMOOOORBX      BBOOOOOBX      :BMOOOOMB.     cBROOOOBB      MBOOOORB7       ;BMOOORB                         7BMOOOOOOOB1                                                                                               </br>');
  vLogoUnifev.Add('     7BROOOOBB7     PBROOOORBX      BBOOOOOBP      :BMOOOOMB.     cBROOOOBB      MBOOOORB7        BBOOOOBu              :          PBMOOOOOBD                                                                                                </br>');
  vLogoUnifev.Add('     ;BMOOOOMBBZc72BBMOOOOORBX      BBOOOORBP      :BMOOOOMB.     cBROOOOBB      MBOOOORB7        PBMOORBBB;        .;ZBB           BBROOOMB                                                                                                 </br>');
  vLogoUnifev.Add('      BBROOORBBBBBBBBBROOOORBX      BBOOOORBP      :BMOOOOMB.     cBROOOOBB      MBOOOORB7         MBMRRBBBBBBRZEMBBBBBBK            BBROOB                                                                                                  </br>');
  vLogoUnifev.Add('      rBBRRORMBBBBBBL;BROOORBP      BBROOORBK      :BMOOOOBB.     cBMOOORBB      MBROOOMBv          uBBBBBBBBBBBBBBBBBBBs            .BBRB:                                                                                                  </br>');
  vLogoUnifev.Add('       :BBBBBBBBBBP. .BBBBBBBR      BBBBBBBBM      :BBBBBBBB,     uBBBBBBBB      BBBBBBBB3            JBBBBBBBBBBBBBBBBO.             ;BB7                                                                                                   </br>');
  vLogoUnifev.Add('         .cUHXFJ:     ;:::::r:      ;;:::::r;       i:::::;v      .;,,,,:;;      ,,....,;.               :xSGBBBOP1s:                  PM                                                                                                    </br>');
  vLogoUnifev.Add('                                                                                                                                                                                                                                             </br>');
  for vIndex := 0 to Pred(vLogoUnifev.Count) do
    vHTML.Add(StringReplace(vLogoUnifev[vIndex], ' ', '&nbsp', [rfReplaceAll]));
  vLogoUnifev.Free;
  vHTML.Add('	</div>');
  vHTML.Add(' <div class="cabecalho">');
  vHTML.Add('	</br><p>Trabalho de Estrutura de dados - 2º bimestre</p>');
  vHTML.Add(' Nome: André Brito Angeluci - R.A.: 81630</br>');
  vHTML.Add(' Nome: Douglas Henrique dos Santos Gongora - R.A.: 87964</br></br>');
  vHTML.Add('	</div>');

  (* Monta o texto. *)
  if (pBody <> nil) then
    for vIndex := 0 to Pred(pBody.Count) do
      vHTML.Add(pBody[vIndex]);
  vHTML.Add('	</body>');
  vHTML.Add('</html>');

  try
    (* Carrega o html no browser. *)
    vStream := TMemoryStream.Create;
    vHTML.SaveToStream(vStream);
    vStream.Seek(0, 0);
    browserRespostas.Navigate('about:blank');
    while (browserRespostas.ReadyState < READYSTATE_INTERACTIVE) do
      Application.ProcessMessages;
    (browserRespostas.Document as IPersistStreamInit).Load(TStreamAdapter.Create(vStream));

    if not(browserRespostas.Visible) then
      browserRespostas.Show;
  finally
    if (vStream <> nil) then
      FreeAndNil(vStream);
    FreeAndNil(vHTML);
  end;
end;


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  escreveResposta(nil);
end;

end.
