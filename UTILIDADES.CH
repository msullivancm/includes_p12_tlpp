/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Include   ≥UTILIDADES∫Autor  ≥Leonardo Portella   ∫ Data ≥  11/05/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Include com funcoes uteis.                                  ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Uso       ≥Geral                                                       ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

*********************************************************************************************************************************

#IFNDEF _UTILIDADES_CH 
	
	#DEFINE _UTILIDADES_CH 
	            
	#IFNDEF _TOPCONN_CH 
		#INCLUDE "TOPCONN.CH"	
	#ENDIF
	
	#IFNDEF CRLF
		#DEFINE CRLF chr(13) + chr(10)
	#ENDIF
	
	#DEFINE LOG "UTILIDADES.CH [" + If(empty(dbf()),"",DtoC(Date()) + "-")  + Time() + "] - "   
    
	#xcommand DEFAULT <uVar1> := <uVal1> ;
	  							    [, <uVarN> 	:= <uValN> ] => ;
	    							<uVar1> 	:= If( <uVar1> == nil, <uVal1>, <uVar1> ) ;;
								   	[ <uVarN> 	:= If( <uVarN> == nil, <uValN>, <uVarN> ); ]
								   	
	#translate bSetGet(<uVar>) => {|u| If(PCount() > 0, <uVar> := u, <uVar>)}     

*********************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Tratamento de excecoes a ser usado conforme o exemplo abaixo:                                ≥
//≥                                                                                             ≥
//≥Local oException                                                                             ≥
//≥                                                                                             ≥
//≥...                                                                                          ≥
//≥                                                                                             ≥
//≥TRY                                                                                          ≥
//≥       cTst := 1 + 'A' //Erro de type mismatch                                               ≥
//≥                                                                                             ≥
//≥CATCH USING oException                                                                       ≥
//≥                                                                                             ≥
//≥       If ( ValType( oException ) == "O" )                                                   ≥
//≥                                                                                             ≥
//≥            uRet := 'LEONARDO' + CRLF                                                        ≥
//≥ 	       uRet += replicate('_',20) + CRLF + CRLF                                          ≥
//≥ 	       uRet += If( !Empty( oException:Description ) 	, oException:Description , "" ) ≥
//≥ 	       uRet += If( !Empty( oException:ErrorStack ) 	, oException:ErrorStack  , "" )     ≥
//≥ 	                                                                                        ≥
//≥ 	       MsgInfo(uRet)                                                                    ≥
//≥ 	       	                                                                                ≥
//≥	                                                                                            ≥
//≥       EndIf                                                                                 ≥
//≥	                                                                                            ≥
//≥ENDCATCH                                                                                     ≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

	#IFNDEF _TRYEXCEPTION_CH
	
		#DEFINE _TRYEXCEPTION_CH
	
		#DEFINE TRY_ELEMENTS			5
	
		#DEFINE TRY_ERROR_BLOCK			1
		#DEFINE TRY_SYSERROR_BLOCK		2
		#DEFINE TRY_INDEX				3
		#DEFINE TRY_OBJERROR     		4
		#DEFINE TRY_ERROR_MESSAGE		5
	
		#XTRANSLATE	TRY 			=> TRYEXCEPTION
		#XTRANSLATE	CATCH 			=> CATCHEXCEPTION
		#XTRANSLATE	END TRY			=> ENDEXCEPTION
		#XTRANSLATE	ENDTRY			=> ENDEXCEPTION
		#XTRANSLATE	END EXCEPTION	=> ENDEXCEPTION
		#XTRANSLATE	ENDCATCH		=> ENDEXCEPTION
	
		#XCOMMAND TRYEXCEPTION  	=> ;
			IF( !( Type( "aTryException" ) == "A" ) .or. !( Type( "nTryException" ) == "N" ) , PutTryExceptionVars() , NIL ) ;;
			aAdd( aTryException , Array(TRY_ELEMENTS) ) ;;
			++nTryException ;;
			aTryException\[nTryException\]\[TRY_ERROR_BLOCK\]		:= ErrorBlock( \{ \|oError\| BREAK( @oError ) \} ) ;;
			aTryException\[nTryException\]\[TRY_SYSERROR_BLOCK\]	:= SysErrorBlock( \{ \|oError\| BREAK( @oError ) \} ) ;;
			aTryException\[nTryException\]\[TRY_INDEX\]	:= nTryException ;;
			ErrorBlock( \{ \|oError\| aTryException\[nTryException\]\[TRY_OBJERROR\] := oError , BREAK( @oError ) \} ) ;;
			SysErrorBlock( \{ \|oError\| aTryException\[nTryException\]\[TRY_OBJERROR\] := oError , BREAK( @oError ) \} ) ;;
			BEGIN SEQUENCE ;;
		
		#XCOMMAND TRYEXCEPTION USING <bError> [PARAMETERS <aParameters>] => ;
			IF( !( Type( "aTryException" ) == "A" ) .or. !( Type( "nTryException" ) == "N" ) , PutTryExceptionVars() , NIL ) ;;
			aAdd( aTryException , Array( TRY_ELEMENTS ) ) ;;
			++nTryException ;;
			aTryException\[nTryException\]\[TRY_ERROR_BLOCK\]		:= ErrorBlock( \{ \|oError\| BREAK( @oError ) \} ) ;;
			aTryException\[nTryException\]\[TRY_SYSERROR_BLOCK\]	:= SysErrorBlock( \{ \|oError\| BREAK( @oError ) \} ) ;;
			aTryException\[nTryException\]\[TRY_INDEX\]	:= nTryException ;;
			ErrorBlock( \{ \|oError\| aTryException\[nTryException\]\[TRY_OBJERROR\] := oError , Eval( <bError> , @oError , [@<aParameters>] ) \} ) ;;
			SysErrorBlock( \{ \|oError\| aTryException\[nTryException\]\[TRY_OBJERROR\] := oError , Eval( <bError> , @oError , [@<aParameters>] ) \} ) ;;
			BEGIN SEQUENCE ;;
	
		#XCOMMAND CATCHEXCEPTION	=>  ;
				aTryException\[nTryException\]\[TRY_ERROR_MESSAGE\] := CaptureError( .T. , @nTryException , @nTryException , 1 ) ;; 
				RECOVER ;;
		
		#XCOMMAND CATCHEXCEPTION USING <oException> => ;
			RECOVER ;;
			aTryException\[nTryException\]\[TRY_ERROR_MESSAGE\] := CaptureError( .T. , @nTryException , @nTryException , 1 ) ;; 
			<oException>	:= aTryException\[nTryException\]\[TRY_OBJERROR\] ;;
		
		#XCOMMAND ENDEXCEPTION		=> ;
			END SEQUENCE ;;
			IF ( ( Type( "aTryException" ) == "A" ) .and. ( Type( "nTryException" ) == "N" ) ) ;;
				IF ( ValType(aTryException\[nTryException\]\[TRY_ERROR_BLOCK\]) == "B" ) ;;
					ErrorBlock( aTryException\[nTryException\]\[TRY_ERROR_BLOCK\] ) ;;
				ENDIF ;;
				IF ( ValType(aTryException\[nTryException\]\[TRY_SYSERROR_BLOCK\]) == "B" ) ;;
					SysErrorBlock( aTryException\[nTryException\]\[TRY_SYSERROR_BLOCK\] ) ;;
				ENDIF ;;
				aDel( aTryException , nTryException ) ;;
				aSize( aTryException , --nTryException ) ;;
			ENDIF ;;
	
		#XCOMMAND ENDEXCEPTION NODELSTACKERROR		=> ;
			END SEQUENCE ;;
			IF ( ( Type( "aTryException" ) == "A" ) .and. ( Type( "nTryException" ) == "N" ) ) ;;
				IF ( ValType(aTryException\[nTryException\]\[TRY_ERROR_BLOCK\]) == "B" ) ;;
					ErrorBlock( aTryException\[nTryException\]\[TRY_ERROR_BLOCK\] ) ;;
				ENDIF ;;
				IF ( ValType(aTryException\[nTryException\]\[TRY_SYSERROR_BLOCK\]) == "B" ) ;;
					SysErrorBlock( aTryException\[nTryException\]\[TRY_SYSERROR_BLOCK\] ) ;;
				ENDIF ;;
				--nTryException ;;
			ENDIF ;;
	
************************************************************************************************************************************

		Static Function PutTryExceptionVars()
			Public aTryException	:= {}
			Public nTryException	:= 0
		Return ( NIL )
		
************************************************************************************************************************************

		Static Function CaptureError( lObjError , nStart , nFinish , nStep )
			Local cError		:= ''
			Local lTryException	:= ( ( Type( 'aTryException' ) == 'A' ) .and. ( Type( 'nTryException' ) == 'N' ) )
			Local nError
			IF ( lTryException )
				lObjError	:= IF( ( lObjError == NIL ) , .F. , lObjError )
				nStart 		:= IF( ( nStart == NIL ) , 1 , nStart )
				nFinish		:= IF( ( nFinish == NIL ) , Len( aTryException ) , nFinish )
				nStep		:= IF( ( nStep == NIL ) , 1 , nStep )
				For nError := nStart To nFinish Step nStep
					IF ( lObjError )
						IF ( ValType( aTryException[nError][TRY_OBJERROR] ) == 'O' )
							cError	+= aTryException[nError][TRY_OBJERROR]:Description
							cError	+= aTryException[nError][TRY_OBJERROR]:ErrorStack
						EndIF
					Else
						IF ( ValType( aTryException[nError][TRY_ERROR_MESSAGE] ) == 'C' )
							cError += aTryException[nError][TRY_ERROR_MESSAGE]
						EndIF
					EndIF	
				Next nError
			EndIF
		Return( cError )
	
	#ENDIF
	
************************************************************************************************************************************
	
/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥ExecExcel ∫Autor  ≥Leonardo Portella   ∫ Data ≥  14/12/10   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Executa um arquivo CSV no Excel.                            ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function ExecExcel(cArqCSV, lAviso, cCaption, lReadOnly)

Local lOk 			:= .F.

Default lAviso 		:= .F.
Default cCaption 	:= ''
Default lReadOnly	:= .F.

cArqCSV := allTrim(cArqCSV)

If File(cArqCSV)
		
	If !ApOleClient("MSExcel")
                  
	   cMsg := "EXECEXCEL" + CRLF + replicate('_',10) + CRLF + CRLF + "Microsoft Excel n„o instalado!"
	   	
	   If lAviso
			Alert(cMsg)
	   EndIf
	   
	   ConOut(LOG + cMsg)
	   
	Else

	   oExcelApp 	:= MsExcel():New()
	   
	   If !empty(cCaption)
	   		oExcelApp:SetCaption(cCaption)
	   EndIf
	        
	   If lReadOnly 
	   		cRet := oExcelApp:WorkBooks:Add(cArqCSV)//somente leitura
	   Else
	   		cRet := oExcelApp:WorkBooks:Open(cArqCSV)
	   EndIf

	   oExcelApp:SetVisible(.T.)
	   
	   If !empty(cRet)
	   		
	   		nPosIni := At('Exception',cRet) + 12
	   			
			If nPosini > 0 .and. !empty(cLog)

			   	cLog 	:= right(cRet,len(cRet)-nPosini)
	                          
				cMsg 	:= "EXECEXCEL" + CRLF + replicate('_',10) + CRLF + CRLF + "DescriÁ„o: " + cLog
			
				If lAviso
					Alert(cMsg)
				EndIf
				
				ConOut(LOG + cMsg)
		   		
		   EndIf
		   
	   Else
	      
	       If !empty(cRet)
	            
	            nPosIni := At('Exception',cRet) + 12
	   			
				If nPosini > 0
			    
				   	cLog 	:= right(cRet,len(cRet)-nPosini)
		                          
					cMsg 	:= "EXECEXCEL" + CRLF + replicate('_',10) + CRLF + CRLF + "DescriÁ„o: " + cLog
				
					If lAviso
						Alert(cMsg)
					EndIf
					
					ConOut(LOG + cMsg)
			   		
			   EndIf
			   
		   Else
		   		lOk := .T.
		   EndIf
    
		EndIf
		                        
		oExcelApp:Destroy()     
		
	EndIf
	
ElseIf !empty(cArqCSV)
                  
    cMsg := "EXECEXCEL" + CRLF + replicate('_',10) + CRLF + CRLF + "O arquivo: " + CRLF + cArqCSV + CRLF + "n„o foi encontrado!"
    
    If lAviso
		Alert(cMsg)
	EndIf
	
	ConOut(LOG + cMsg)
	
Else
                  
    cMsg := "EXECEXCEL" + CRLF + replicate('_',10) + CRLF + CRLF + "Nome do arquivo informado em branco!"
    
    If lAviso
		Alert(cMsg)
	EndIf
	
	ConOut(LOG + cMsg)	
			
EndIf
	
Return lOk

*********************************************************************************************************************************
                                          
/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥GrvTabEmp ∫Autor  ≥Leonardo Portella   ∫ Data ≥  31/12/10   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Funcao para dar Update na tabela da empresa informada.      ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥cTabela: Nome da Tabela (ex: SF2AG0)                        ∫±±
±±∫          ≥nRecno : Numero do RECNO da linha a ser atualizada na tabela∫±±
±±∫          ≥aCampo : Array bidimensional, sendo:                        ∫±±
±±∫          ≥         aCampo[i][1] => Nome do campo no SX3               ∫±±
±±∫          ≥         aCampo[i][2] => Conteudo a ser gravado no campo    ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function GrvTabEmp(cTabela, nRecno, aCampo, lAviso)

Local cQry 	:= ''
Local lOk   := .F.
Local nX 	:= 1 

Default lAviso := .F.

cQry += "UPDATE " + cTabela 							+ CRLF
cQry += "SET " 											+ CRLF

For nX := 1 to len(aCampo)
	
	Do Case
	
		Case ValType(aCampo[nX][2]) == 'D'
	    	aCampo[nX][2] := DtoS(aCampo[nX][2])
	    	
		Case ValType(aCampo[nX][2]) == 'N'
	    	aCampo[nX][2] := allTrim(str(aCampo[nX][2]))
	    	
		Case ValType(aCampo[nX][2]) == 'U'
			loop

	EndCase
	
	lOk := .T.
	
	If nX > 1
		cQry += ","
	EndIf

	cQry += aCampo[nX][1] + "='" + aCampo[nX][2] + "'"	+ CRLF

Next

cQry += "WHERE R_E_C_N_O_ = " + allTrim(str(nRecno)) 	+ CRLF
        
If lOk

	nRet := TcSqlExec(cQry)
	          
	cMsg := "GRVTABEMP" + CRLF + replicate('_',10) + CRLF + CRLF + TcSqlError() + "!"
	
	If nRet != 0

		If lAviso
			Alert(cMsg)
		EndIf
		
		ConOut(LOG + cMsg)

	EndIf
		
EndIf

Return

************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥MoveFile  ∫Autor  ≥Elmo de Oliveira    ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Move um arquivo.                                            ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- cArqOr: Nome do arquivo de origem.                        ∫±±
±±∫          ≥- cArqDes: Nome do destino.                                 ∫±±
±±∫          ≥- lDelOrig: Deleta o arquivo original. Default .T.          ∫±±
±±∫          ≥  Caso esteja como .T. e nao conseguir deletar o arquivo    ∫±±
±±∫          ≥  original, retorna .F. e deleta o arquivo copiado.         ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- .T. se obteve sucesso e .F. caso contrario.               ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function MoveFile(cArqOr,cArqDes,lDelOrig)

Local lResult := .F.                   

Default lDelOrig := .T. //Leonardo Portella

//Leonardo Portella
cArqOr 	:= allTrim(cArqOr)
cArqDes := allTrim(cArqDes)
   
Copy File &cArqOr TO &cArqDes

lResult := File(cArqDes) // Verifica se o arquivo foi copiado para o destino

If lResult .and. lDelOrig
  Delete File &cArqOr
                                           
  //Leonardo Portella
  If File(cArqOr) //Nao conseguiu deletar o original
	  Delete File &cArqDes //Deleta o arquivo copiado e retorna falso
	  lResult := .F.
  EndIf
  
EndIf

If lResult
	FRenameEx( lower(cArqDes), cArqDes ) //Renomeia case sentitive
EndIf

Return lResult
      
************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥LogErros  ∫Autor  ≥Leonardo Portella   ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Tela para exibir um log.                                    ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- uLog: Conteudo a ser exibido.                             ∫±±
±±∫          ≥- cTit: Titulo. Default 'Log'                               ∫±±
±±∫          ≥- lReadOnly: Somente leitura. Default .T.                   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- Caracter retornando o conteudo da tela.                   ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function LogErros(uLog,cTit,lReadOnly,cTamanho, nTempo)
       
Local cMemo 		:= ''
Local aTamDia		
Local aTamMget	
Local aTamBut	
                           
Default cTit 		:= "Log"
Default lReadOnly 	:= .T.
Default cTamanho 	:= 'P'
Default nTempo 		:= 0

Do Case

	Case Upper(cTamanho) == 'P'
		aTamDia		:= {360,450}
		aTamMget	:= {215,150}
		aTamBut		:= {165,135}
		
	Case Upper(cTamanho) == 'M'
		aTamDia		:= {550,600}
		aTamMget	:= {290,240}
		aTamBut		:= {255,210}
	
	Case Upper(cTamanho) == 'G'
		aTamDia		:= {360,450}
		aTamMget	:= {215,150}
		aTamBut		:= {165,135}
		
	Otherwise
		aTamDia		:= {360,450}
		aTamMget	:= {215,150}
		aTamBut		:= {165,135}

EndCase

Do Case
       
	Case ValType(uLog) == 'N'
		uLog := cValToChar(uLog)
		
	Case ValType(uLog) == 'L'
		uLog := If(uLog,'.T.','.F.')
		
	Case ValType(uLog) == 'C'
		
	OtherWise
		uLog := ''
				
EndCase
         
If !empty(uLog) .or. !lReadOnly //Se nao for somente leitura eh pq o usuario espera uma entrada de dados

	Define MsDialog oDlgLog Title cTit From 0,0 to aTamDia[1],aTamDia[2] Pixel
	
	cMemo := uLog
	oMemo := tMultiGet():New(05,05,{|u|if(Pcount()>0,cMemo:=u,cMemo)},oDlgLog,aTamMget[1],aTamMget[2],,,,,,.T.,,,,,,lReadOnly)
	
	If lReadOnly
	
		oSButton1 := SButton():New(aTamBut[1],aTamBut[2]		,1 ,{||oDlgLog:End()}	,oDlgLog,.T.,,)
		oSButton2 := SButton():New(aTamBut[1],aTamBut[2] + 30	,6 ,{||PrintLog(cMemo)}	,oDlgLog,.T.,,)
		oSButton3 := SButton():New(aTamBut[1],aTamBut[2] + 60	,13,{||GrvLog(cMemo)}	,oDlgLog,.T.,,)
		
	Else
		
		oSButton1 := SButton():New(aTamBut[1],aTamBut[2] + 60,1 ,{||oDlgLog:End()}		,oDlgLog,.T.,,)
		
	EndIf
	
	If nTempo > 0
	
		oTimer := TTimer():New(nTempo,{|| oDlgLog:End() },oDlgLog)
		oTimer:Activate()
		
	EndIf
	
	Activate MsDialog oDlgLog Centered on Init oSButton1:SetFocus()
	
EndIf

Return cMemo

************************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Grava e exibe o log da funcao LogErros≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

Static Function GrvLog(cMemo)

Local nOpca 	:= GETF_LOCALFLOPPY + GETF_LOCALHARD + GETF_NETWORKDRIVE + GETF_RETDIRECTORY
Local cPath 	:= cGetFile (,'Selecione o local', 1,'C:\',.T.,nOpca,.T.,.T.)    
Local cArq		:= cPath + 'LOG_DT' + StrTran(DtoC(Date()),'/','') + '_HR' + StrTran(Time(),':','') + '.txt'
Local lOk 		:= !empty(cPath)

If lOk .and. File(cArq)
       
	nHdl := FCreate(cArq)

	If nHdl > 0
		FClose(nHdl)
	Else
		lOk := .F.
		Alert('N„o foi possÌvel criar o arquivo de log.')
	EndIf

EndIf

If lOk

	MemoWrite(cArq, cMemo) 
	
	cCmd := getEnv('ComSpec')
	
	WinExec(left(cCmd,Rat('\',cCmd)) + 'notepad.exe ' + cArq)

EndIf

Return

************************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Imprime o conteudo da variavel cMemo da funcao LogErros ≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

Static Function PrintLog(c_Log)

Local oReport            

If !empty(c_Log)

	Private cLog := allTrim(c_Log)
	
	oReport:= DefRep()
	oReport:PrintDialog()

Else

	Aviso('ATEN«√O','N„o h· dados!',{'Ok'})

EndIf

Return

********************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Auxiliar para a funcao PrintLog≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

Static Function DefRep()

Local oReport 
Local oLog 

oReport	:= TReport():New("Log","Log","", {|oReport| PrintRep(oReport)},"Log")

oReport:SetLandscape() //Impress„o em paisagem.  

oLog := TRSection():New(oReport,"Log")

TRCell():New(oLog ,'LOG'	,,'Log'			,/*Picture*/	,220	,/*lPixel*/,/*{|| code-block de impressao }*/,,,"LEFT"		)

Return(oReport)

********************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Auxiliar para a funcao PrintLog≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

Static Function PrintRep(oReport)

Local j := 1
Local i := 1

Private oLog   	:= oReport:Section(1)

cEnt 	:= char(13)+char(10)

aTexto 	:= strTokArr(cLog,cEnt)

nTot	:= len(aTexto)
cTot	:= allTrim(Transform(nTot,'@E 999,999,999'))

oReport:SetMeter(nTot) 

nTot	:= 0

oLog:init()
	                                                
For i := 1 to len(aTexto)
        
    If oReport:Cancel()  
	    
	    oReport:FatLine()     
	    oReport:PrintText('Cancelado pelo operador!!!',,,CLR_RED,,,.T.)
	    
	    exit
	    
	EndIf 
	
	oReport:SetMsgPrint("Imprimindo a linha " + allTrim(Transform(++nTot,'@E 999,999,999')) + " de " + cTot)
	oReport:IncMeter()
    
    aLinhas := qbTexto(aTexto[i],200," ")
	                                
	For j := 1 to len(aLinhas)
	
		oLog:Cell('LOG'):SetValue(aLinhas[j])
		
		oLog:PrintLine()
		
	Next
	
Next

oLog:Finish()

Return   

************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥SqlToTmp  ∫Autor  ≥Leonardo Portella   ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Funcao para executar uma Query e criar uma tabela temporaria∫±±
±±∫          ≥no banco de dados preenchida com o resultado da Query passa-∫±±
±±∫          ≥da por parametro, permitindo usar RecLock na tabela e fazer ∫±±
±±∫          ≥consultas com o retorno da tabela.                          ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Obs       ≥Usar junto com a funcao FechaSqlTmp(cTabReferencia) para    ∫±±
±±∫          ≥poder excluir a tabela temporaria criada pela funcao.       ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- cQuery: Query usada para preencher a tabela.              ∫±±
±±∫          ≥- aStruTmp: Array usado para construir a tabela:            ∫±±
±±∫          ≥  {Nome, Tipo, Tamanho, Decimal}                            ∫±±
±±∫          ≥- cAliasTmp: Alias usado no dbUseArea para preencher a tabe-∫±±
±±∫          ≥  la.                                                       ∫±±
±±∫          ≥- cTabReferencia: Por referencia (@), uma variavel que sera ∫±±
±±∫          ≥  preenchida com o nome da tabela temporaria para serem     ∫±±
±±∫          ≥  feitas consultas posteriormente e para poder deletar a ta-∫±±
±±∫          ≥  bela atraves da funcao FechaSqlTmp().                     ∫±±
±±∫          ≥- lLog : exibe a tela com o erro, caso tenha ocorrido.      ∫±±
±±∫          ≥  Default = .T.                                             ∫±±
±±∫          ≥  bela atraves da funcao FechaSqlTmp().                     ∫±±
±±∫          ≥- cOrder : ordem a ser utilizada no indice. Formato exemplo ∫±±
±±∫          ≥  A1_NOME + A1_COD.                                         ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- Numerico contendo a quantidade de registros (-1 se tiver  ∫±±
±±∫          ≥  ocorrido algum erro).                                     ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function SqlToTmp(cQuery, aStruTmp, cAliasTmp, cTabReferencia, lLog, cOrder)

Local nI		:= 0
Local nJ        := 0
Local nTotalReg := 0

Default lLog 			:= .T.
Default cTabReferencia	:= ' '
Default cOrder			:= ' '

ProcRegua(0) 

For nI := 1  to 5
	IncProc('Consultando registros...')    
Next	

FechaSqlTmp(cTabReferencia)

If Select(cAliasTmp) <> 0
	(cAliasTmp)->(DbCloseArea())
Endif

cTabTmp	:= CriaTrab(Nil,.F.)

DbCreate(cTabTmp,aStruTmp,"TopConn")

cColunas := ''

For nJ := 1 to len(aStruTmp)
	cColunas += aStruTmp[nJ][1] + ','
Next

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥A query devera conter o D_E_L_E_T_ e o R_E_C_N_O_        ≥
//≥pois estes sao utilizados como chave primaria. Caso nao  ≥
//≥contenha ira ocorrer erro de chave primaria (PK) violada.≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

cColunas += "D_E_L_E_T_,R_E_C_N_O_"

cQueryIns := "INSERT INTO " + cTabTmp + " (" + cColunas + ")" + CRLF + cQuery
   
lExecOk := ( TcSqlExec(cQueryIns) >= 0 )

If lExecOk

	TcRefresh(cTabTmp)
	
	cTabReferencia := cTabTmp
	
	dbUseArea(.T.,"TopConn",cTabTmp,cAliasTmp,.T.,.F.)
	
	(cAliasTmp)->(DbGoTop())
	
	//Ordem, exemplo A1_NOME + A1_COD
	If !empty(cOrder)
		cOrder := allTrim(Upper(cOrder))		
		
		(cAliasTmp)->(dbCreateIndex(cTabTmp, cOrder, {||&cOrder}, .F. ))
		(cAliasTmp)->(dbCommit())
		(cAliasTmp)->(dbClearInd())
		(cAliasTmp)->(dbSetIndex(cTabTmp))
	EndIf
	
	cQry := "SELECT COUNT(*) QTDREGS" 	+ CRLF 
	cQry += "FROM " + cTabTmp 			+ CRLF 
	
	TcQuery cQry New Alias 'CONT'
	
	If !CONT->(EOF())
		nTotalReg := CONT->(QTDREGS)
	EndIf            
	
	CONT->(dbCloseArea())
	
Else

	uRet := LOG + 'SqlToTmp' + CRLF
    uRet += replicate('_',40) + CRLF 
    uRet += 'Ocorreu um erro na inserÁ„o abaixo:' + CRLF
    uRet += replicate('_',40) + CRLF 
    uRet += cQueryIns + CRLF
	uRet += replicate('_',40) + CRLF + CRLF
    uRet += TcSqlError()
    
    If lLog
    	LogErros(uRet,'LOG')
	EndIf
	
	FechaSqlTmp(cTabReferencia)
	
	nTotalReg :=  -1

EndIf

Return nTotalReg

************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥FechaSqlTmp∫Autor ≥Leonardo Portella   ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Fecha/exclui a tabela temporaria criada pela funcao SqlToTmp∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Obs       ≥Usar junto com a funcao SqlToTmp para poder excluir a tabela∫±±
±±∫          ≥temporaria criada pela funcao.                              ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- cTabReferencia: Nome da tabela recebido por referencia da ∫±±
±±∫          ≥funcao SqlToTmp.                                            ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- Nenhum                                                    ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function FechaSqlTmp(cTabReferencia)

dbCloseArea(cTabReferencia)

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥As tabelas do Protheus tem 6 caracteres no nome. Faco esta verificacao   ≥
//≥para evitar dropar uma tabela caso tenham passado uma tabela do sistema  ≥
//≥por engano. As tabelas passadas pelo CriaTrab tem mais de 6 caracteres.  ≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

If ( len(allTrim(cTabReferencia)) > 6 ) .and. TcCanOpen(cTabReferencia) 
	TcDelFile(cTabReferencia)
EndIf                              

Return
 
************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥MesExtIng ∫Autor  ≥Leonardo Portella   ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Retorna o nome do mes em ingles.                            ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- nMes: Numero correpondente ao mes desejado.               ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- Caracter com o mes em extenso em ingles.                  ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function MesExtIng(nMes)

Local aMesIngles 	:= {'January','February','March','April','May','June','July','August','September','October','November','December'}
Local cRet 			:= " "

Default nMes := Month(Date())

If ValType( nMes ) == "C"
	nMes := Int(Val(nMes))
ElseIf ValType (nMes) == "D"
	nMes := Month(nMes)
EndIf

If nMes > 0 .and. nMes <= 12
	cRet := aMesIngles[nMes]
EndIf

Return cRet           

************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥nCalcIdade∫Autor  ≥Leonardo Portella   ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Retorna a idade em uma determinada data informada.          ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- dNasc: Data de nascimento                                 ∫±±
±±∫          ≥- dCalc: Data a ser considerada para o calculo.             ∫±±
±±∫          ≥  Default Date().                                        ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- Numerico contendo a idade.                                ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function nCalcIdade(dNasc, dCalc)
             
Local nIdade 	:= Year(dCalc) - Year(dNasc) - 1

Default dCalc 	:= dDataBase

If Month(dCalc) > Month(dNasc) 

	++nIdade

ElseIf Month(dCalc) == Month(dNasc) 

	If Day(dCalc) >= Day(dNasc)
	
		++nIdade
	
	EndIf 

EndIf

Return nIdade

************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥F3Select  ∫Autor  ≥Leonardo Portella   ∫ Data ≥  05/06/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Funcao para retornar uma tela de consulta com marcacao para ∫±±
±±∫          ≥poder selecionar separadamente as opcoes.                   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Obs:      ≥- Criar uma consulta especifica com a expressao .T. e com o ∫±±
±±∫          ≥  retorno contendo uma User Function chamando esta funcao e ∫±±
±±∫          ≥  utilizando o #INCLUDE 'UTILIDADES.CH'.                    ∫±±
±±∫          ≥- Tambem pode ser utilizado apos o PERGUNTE() e neste caso  ∫±±
±±∫          ≥  nao ha limite para o retorno da funcao. Neste caso utilize∫±±
±±∫          ≥  o parametro lAvisoExcedeu como .F. para que nao seja exi- ∫±±
±±∫          ≥  bido o Alert quando ultrapassar os 99 caracteres limites  ∫±±
±±∫          ≥  do SX1.                                                   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Parametros≥- c_Tabela - Nome da tabela (ex: SA1)                       ∫±±
±±∫          ≥- c_Cabec - Campos a serem exibidos no cabecalho da consulta∫±±
±±∫          ≥  (Ex: A1_COD|A1_LOJA|A1_NOME)                              ∫±±
±±∫          ≥- c_CpoRet - Campo a ser retornado pela consulta. Deve estar∫±±
±±∫          ≥  contido no cabecalho. Default primeiro campo no cabecalho ∫±±
±±∫          ≥  (Ex: A1_COD)                                              ∫±±
±±∫          ≥- cTitulo - Titulo a ser exibido na tela da consulta.       ∫±±
±±∫          ≥  Default: Nome da tabela no SX2                            ∫±±
±±∫          ≥- c_FilSql - Filtro em Sql a ser executado na query que     ∫±±
±±∫          ≥  retorna os dados. Caso este parametro seja preenchido,    ∫±±
±±∫          ≥  fica a cargo do usuario fazer o filtro da filial. Caso    ∫±±
±±∫          ≥  este parametro nao seja informado, a filial sera tratada  ∫±±
±±∫          ≥  por default com o xFilial(cTabela). (Ex:A1_NOME LIKE 'L%')∫±±
±±∫          ≥- c_OrderSql - Order By do Sql. Default em branco.          ∫±±
±±∫          ≥- lAvisoExcedeu - exibe um Alert quando ultrapassar os 99   ∫±±
±±∫          ≥  caracteres limites do SX1. Default .T.                    ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Retorno   ≥- Caracter contendo o conteudo do campo informado no        ∫±±
±±∫          ≥  parametro c_CpoRet ou, caso este nao seja informado, o    ∫±±
±±∫          ≥  primeiro campo informado no parametro c_Cabec e, caso este∫±±
±±∫          ≥  tambem nao seja informado, o primeiro campo no SX3 da ta- ∫±±
±±∫          ≥  bela usado e com nivel maior ou igual ao do usuario cor-  ∫±±
±±∫          ≥  rente que nao seja a filial.                              ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function F3Select(c_Tabela,c_Cabec,c_CpoRet,cTitulo,c_FilSql,c_OrderCpos,lAvisoExcedeu,cSeparador)

Local i 				:= 1

Default c_Cabec 		:= ''
Default c_CpoRet 		:= ''
Default cTitulo			:= ''
Default c_FilSql		:= ''
Default c_OrderCpos		:= ''
Default lAvisoExcedeu	:= .T.   
Default cSeparador  	:= '|'

Private cSqlToTmp  		:= ''       
Private cTabela			:= c_Tabela
Private cMarca 			:= GetMark()
Private cAlias			:= GetNextAlias()
Private lInverte		:= .F.
Private cCabec			:= allTrim(upper(c_Cabec))
Private cCpoRet			:= allTrim(upper(c_CpoRet))
Private cFilSql			:= allTrim(upper(c_FilSql))	
Private aCpoMsSel		:= {}
Private aCpoTrb			:= {}
Private nPosRet			:= 0
Private lConfirmou		:= .F.
Private cCpoFil			:= ''
Private cOrderCpos		:= allTrim(Upper(c_OrderCpos))
Private cRetF3Sel 		:= ''

cTabela := allTrim(Upper(cTabela)) 
                 
dbSelectArea('SX3')
dbSetOrder(1)

If !MsSeek(cTabela)
	alert('A tabela informada n„o est· cadastrada no SX3!')
	Return   
Else
	cCpoFil := allTrim(SX3->X3_CAMPO) //Filial
EndIf          

CriaCpoMsSel(cTabela,cCabec,cFilSql)

nPosRet := aScan(aCpoMsSel,{|x|allTrim(x[1]) == cCpoRet})

If nPosRet <= 0
	
	//Se nao for informado retorna o segundo do alias (o primeiro eh o Marca)
	If !empty(cCpoRet) 
		alert('O campo de retorno (' + cCpoRet + ') deve estar entre o(s) campo(s) do cabecalho (' + allTrim(cCabec) + ')!')
		Return   
	ElseIf right(allTrim(aCpoMsSel[2][1]),6) == 'FILIAL'
		cCpoRet := aCpoMsSel[3][1]
	Else
		cCpoRet := aCpoMsSel[2][1]
	EndIf
	
EndIf   

If !empty(cOrderCpos)

	aOrder := StrTokArr(cOrderCpos,'|')
	    
	cErro := ''
	
	For i := 1 to len(aOrder)
		If aScan(aCpoMsSel,{|x|allTrim(x[1]) == allTrim(Upper(aOrder[i]))}) <= 0
			cErro += allTrim(Upper(aOrder[i])) + ','		
		EndIf
	Next
	
	If !empty(cErro)
		alert('O(s) seguinte(s) campo(s) de ordem deve(m) estar entre o(s) campo(s) do cabecalho (' + left(cErro,len(cErro) - 1) + ')!')
		Return   
	EndIf
	
	cOrderCpos := StrTran(cOrderCpos,'|','+')

EndIf

nRegs := CriaAliasSql()

If nRegs > 0
       
	If empty(cTitulo)
	     
		dbSelectArea('SX2')
		dbSetOrder(1)
		
	    If MsSeek(cTabela)
	    	cTitulo := SX2->X2_NOME 
	    EndIf
	    
	EndIf
	
	DEFINE DIALOG oDlg TITLE cTitulo FROM 180,180 TO 550,700 PIXEL
	
	//Obs: MsSelect se encarrega de marcar na tabela temporaria. Nao preciso dar Reclock().
	oMark 	:= MsSelect():New(cAlias,"MARCA","",aCpoMsSel,@lInverte,@cMarca,{15,01,165,261})

	oMark:oBrowse:lhasMark 		:= .T.
	oMark:oBrowse:lCanAllmark 	:= .F.

	ACTIVATE DIALOG oDlg ON INIT EnchoiceBar(oDlg,{||lConfirmou := .T.,oDlg:End()},{||lConfirmou := .F.,ODlg:End()}) CENTERED
	
	If lConfirmou

		TcRefresh(cAlias)

		cAliasSel := GetNextAlias()

		cQrySel := "SELECT " + cCpoRet	   			+ CRLF 
	    cQrySel += "FROM " + cSqlToTmp 	 			+ CRLF
	    cQrySel += "WHERE MARCA <> ' '"  			+ CRLF
	    
	    TcQuery cQrySel New Alias cAliasSel
		                                
		cAliasSel->(dbGoTop())	
		
		While !cAliasSel->(EOF())	
		
			uRet := cAliasSel->&(cCpoRet)
			
			Do Case
			
				Case valType(uRet) == 'N'
			
				  //	cRetF3Sel += cValToChar(uRet) + '|'      RAQUEL 09/04/14 
				  	cRetF3Sel += cValToChar(uRet)+cSeparador
					
				Case valType(uRet) == 'D'
			
				   //	cRetF3Sel += DtoC(uRet) + '|' RAQUEL 09/04/14      
				   	cRetF3Sel += DtoC(uRet) + cSeparador 
					
				Case valType(uRet) == 'L'
			
				  //	cRetF3Sel += If(uRet,'.T.','.F.') + '|'  RAQUEL 09/04/14 
					cRetF3Sel += If(uRet,'.T.','.F.') + cSeparador
					
				Otherwise
				
				 // 	cRetF3Sel += cValToChar(uRet) + '|'      RAQUEL 09/04/14 
				   	cRetF3Sel += cValToChar(uRet) + cSeparador
			EndCase
			
			cAliasSel->(dbSkip())
				
		EndDo	
		
		cAliasSel->(dbCloseArea())
		
		cRetF3Sel := left(cRetF3Sel,len(cRetF3Sel) - 1)
	
	EndIf
	
	If lAvisoExcedeu .and. len(cRetF3Sel) > 99
		Alert('O retorno excedeu o limite de 99 caracteres. Favor selecionar menos opÁıes.')	
	EndIf

	FechaSqlTmp(cSqlToTmp)
	
Else
	Aviso('ATEN«√O','N„o h· dados para os par‚metros informados',{'Ok'})
EndIf

If Select(cAlias) > 0
	(cAlias)->(dbCloseArea())
EndIf

Return cRetF3Sel

************************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Cria os campos do MsSelect para a funcao F3Select≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ
      
Static Function CriaCpoMsSel(cTabela,cCabec,cFilSql)

Local nI := 1

ProcRegua(0)

//{Nome, Tipo, Tamanho, Decimal}
aAdd(aCpoTrb	,{"MARCA"		,"C"	,len(cMarca)	   				,0	})

//{Nome campo, , Titulo, Picture}
aAdd(aCpoMsSel	,{"MARCA"		,  		," " 		,""						})

If empty(cCabec)

	While( !SX3->(EOF()) .and. SX3->X3_ARQUIVO == cTabela )
	     
		IncProc('Selecionando registros...')
		
		If ( X3USO(SX3->X3_USADO) .and. cNivel >= SX3->X3_NIVEL .and. SX3->X3_TIPO != 'M' )
		     
			aAdd(aCpoMsSel	,{X3_CAMPO,			,X3_TITULO	,X3_PICTURE})
		
			aAdd(aCpoTrb	,{X3_CAMPO,X3_TIPO	,X3_TAMANHO	,X3_DECIMAL})
			
		EndIf            
		
		SX3->(dbSkip())
		
	EndDo
	
Else

	aCabec := strTokArr(cCabec,'|')
	
	dbSelectArea('SX3')
	dbSetOrder(2)
	
	For nI := 1 to len(aCabec)
	    
		IncProc('Selecionando registros...')
		
		If MsSeek(aCabec[nI]) .and. X3USO(SX3->X3_USADO) .and. cNivel >= SX3->X3_NIVEL .and. SX3->X3_TIPO != 'M'    
	
			aAdd(aCpoMsSel	,{X3_CAMPO,			,X3_TITULO	,X3_PICTURE})
		
			aAdd(aCpoTrb	,{X3_CAMPO,X3_TIPO	,X3_TAMANHO	,X3_DECIMAL})
		
		EndIf
	
	Next
	
EndIf                  

Return

************************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Cria o alias do MsSelect para a funcao F3Select≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

Static Function CriaAliasSql

Local cQuery 	:= ''
Local cSelect 	:= ''
Local nCont 	:= 0
Local i 		:= 1

For i := 1 to len(aCpoMsSel)
    
	If aCpoMsSel[i][1] == 'MARCA'
		cSelect += "' ' MARCA ,"			
	Else
		cSelect += aCpoMsSel[i][1] + ','		
	EndIf
Next                                

//A query devera conter o D_E_L_E_T_ e o R_E_C_N_O_ para utilizar com a funcao SqlToTmp
cSelect += "D_E_L_E_T_,R_E_C_N_O_"                    

cQuery 	:= "SELECT " + cSelect 	  										+ CRLF
cQuery 	+= "FROM " + RetSqlName(cTabela) 								+ CRLF
cQuery 	+= "WHERE D_E_L_E_T_ = ' '"					 					+ CRLF 

If !empty(cFilSql)
	cQuery 	+= 'AND ' + cFilSql 				  						+ CRLF
Else
	cQuery 	+= 'AND ' + cCpoFil + " = '" + xFilial(cTabela) + "'"		+ CRLF
EndIf    

Processa({||nCont := SqlToTmp(cQuery,aCpoTrb,cAlias,@cSqlToTmp,,cOrderCpos)}) //Executa a query e gera o arquivo temporario

(cAlias)->(dbGoTop())

Return nCont

************************************************************************************************************************************

/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±∫Programa  ≥RETLOGIN  ∫Autor  ≥Leonardo Portella   ∫ Data ≥  12/08/11   ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Desc.     ≥Funcao usuada na consulta especifica LOGIN e que retorna os ∫±±
±±∫          ≥codigos dos usuarios Protheus selecionados.                 ∫±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ±±
±±∫Uso       ≥ CABERJ                                                     ∫±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
*/

Static Function RetLogin(lUnicaMar)

Local oOk      	:= LoadBitMap(GetResources(),"LBOK")
Local oNo      	:= LoadBitMap(GetResources(),"LBNO")
Local aVetBx	:= {}         
Local lConfirm	:= .F.
Local cLog 		:= ""
Local aPesq		:= {'Nome','Login','CÛdigo'}
Local cCombo 	:= aPesq[1]   
Local nOpca		:= 0     
Local nTam		:= Len(UsrFullName(RetCodUsr()))
Local cBusca	:= Space(nTam)
Local bPesq		:= {||.T.,nOpca := Pesquisa(aVetBx,cCombo,allTrim(cBusca),lPalChave,oBrowse:nAt),If(nOpca > 0,oBrowse:nAt := nOpca,),oBrowse:Refresh()}
Local aCab		:= {" ","Codigo","Nome","Login","Departamento","Data validade"}
Local aTam		:= {20,50,100,50,80,50}
Local lPalChave	:= .F.  
Local bDesMarca	:= {||aVetBx := DesMarca(aVetBx)}
Local lBuffer	:= .F.
Local i 		:= 1

Default lUnicaMar := .F.

Private oDlg 	:= nil
Private oBrowse	:= nil

SetPrvt("oDlg1","oCBox1")

Processa({||aVetBx := RetArrUsr()})

oDlg := MSDialog():New(0,0,510,850,"SeleÁ„o de usu·rios Protheus",,,.F.,,,,,,.T.,,,.T. )

    oCombo1 := TComboBox():New(010,010,{|u|If(PCount()>0,cCombo:=u,cCombo)},aPesq,40,20,oDlg,,bPesq,,,,.T.,,,,,,,,,'cCombo')
    
	oGet1 	:= TGet():New( 010,50,{|u|If(PCount()>0,cBusca:=u,cBusca),cBusca := PadR(cBusca,nTam)},oDlg,208,008,'',bPesq,CLR_BLACK,CLR_WHITE,,,,.T.,'',,,.F.,.F.,bPesq,.F.,.F.,"","cBusca",,)

	oCheck1 := TCheckBox():New(010,260,'Palavra-chave',{||lPalChave},oDlg,048,008,,,,,CLR_BLACK,CLR_WHITE,,.T.,"",, )
	oCheck1:bLClicked := {||lPalChave := !lPalChave}                  
	
	bClick 	:= {||lBuffer := !aVetBx[oBrowse:nAt,1],If(lUnicaMar,Eval(bDesMarca),),aVetBx[oBrowse:nAt,1] := lBuffer, oBrowse:Refresh()}                                                                          

	oBrowse := TCBrowse():New(030,010,410,190,,aCab,aTam,oDlg,,,,,bClick,,,,,,,.F.,,.T.,,.F.,,, )
    oBrowse:SetArray(aVetBx) 
    
    oBrowse:bLine := {||{If(aVetBx[oBrowse:nAt,1],oOk,oNo)		,;
						aVetBx[oBrowse:nAt,2]  					,;
						aVetBx[oBrowse:nAt,3] 				 	,;
						aVetBx[oBrowse:nAt,4]  					,;
						aVetBx[oBrowse:nAt,5]					,;
						aVetBx[oBrowse:nAt,6]  					}}  
					
	oBrowse:nScrollType := 1 // Scroll VCR        
    
  	oSBtn1     := SButton():New(230,365,1,{||lConfirm := .T.,oDlg:End()}	,oDlg,,"", )
	oSBtn2     := SButton():New(230,395,2,{||oDlg:End()}					,oDlg,,"", )

oDlg:Activate(,,,.T.)	  

If lConfirm 
	
	For i := 1 to len(aVetBx)
		If aVetBx[i][1]
		     cLog += aVetBx[i][2] + ';'
		EndIf                  
	Next                               
	
	cLog := left(cLog,len(cLog)-1)

EndIf

Return cLog                              

*********************************************************************************************************

Static Function DesMarca(aDes)

Local i := 1
           
For i := 1 to len(aDes)
	aDes[i][1] := .F.
Next

Return aDes

*********************************************************************************************************

Static Function RetArrUsr
      
Local aRet 		:= {}
Local aUsers	:= {}
Local nQtd 		:= 0
Local nCont		:= 0
Local cTot 		:= ""
Local i 		:= 1
Local n 		:= 1

ProcRegua(0)

For i := 1 to 5
	IncProc('Selecionando registros...')
Next

aUsers	:= AllUsers()

nQtd 	:= len(aUsers) 

cTot 	:= cValToChar(nQtd)

ProcRegua(nQtd)

For n := 1 to nQtd
    IncProc('Usu·rio ' + cValToChar(++nCont) + ' de ' + cTot)
    aAdd(aRet,{.F.,aUsers[n][1][1],PadR(Capital(lower(aUsers[n][1][4])),40,' '),PadR(Capital(lower(aUsers[n][1][2])),30,' '),aUsers[n][1][12],DtoC(aUsers[n][1][6])})
Next

//Ordena por nome completo
aSort(aRet,,,{|x,y| x[3] < y[3]}) 

Return aRet

*********************************************************************************************************

Static Function Pesquisa(aVetBx,cCombo,cBusca,lPalChave,nAt)
    
Local nOpca := nAt
                         
If !empty(cBusca)

	Do Case
	
		Case cCombo == 'Nome'
		
			If lPalChave
				nOpca := aScan(aVetBx,{|x| Upper(cBusca) $ Upper(x[3]) }, nAt + 1)
			Else
				nOpca := aScan(aVetBx,{|x| Upper(cBusca) == left(Upper(x[3]),len(cBusca)) }, nAt + 1)
			EndIf
		
		Case cCombo == 'Login'
		
			If lPalChave
				nOpca := aScan(aVetBx,{|x| Upper(cBusca) $ Upper(x[4]) }, nAt + 1)
			Else
				nOpca := aScan(aVetBx,{|x| Upper(cBusca) == left(Upper(x[4]),len(cBusca)) }, nAt + 1)
			EndIf
		
		Case cCombo == 'CÛdigo'
		
			If lPalChave
				nOpca := aScan(aVetBx,{|x| Upper(cBusca) $ Upper(x[2]) }, nAt + 1)
			Else
				nOpca := aScan(aVetBx,{|x| Upper(cBusca) == left(Upper(x[2]),len(cBusca)) }, nAt + 1)
			EndIf
		
	EndCase

EndIf

Return nOpca

************************************************************************************************************************************


Static Function NextCodTab(cTabela, cCampo, lComplZero)

Local cAlias		:= GetNextAlias()
Local uMaxCod 

Default lComplZero 	:= .F.	

cCampo 	:= allTrim(Upper(cCampo))
aTamSX3	:= TamSX3(cCampo) 
cTipo 	:= aTamSX3[3]
nTam	:= aTamSX3[1]

cQry := "SELECT CASE WHEN MAX(" + cCampo + ") + 1 IS NULL THEN 1 ELSE MAX(" + cCampo + ") + 1 END NEXT_REG" 	+ CRLF
cQry += "FROM " + RetSqlName(allTrim(Upper(cTabela))) 															+ CRLF
cQry += "WHERE D_E_L_E_T_ = ' '" 						 														+ CRLF

TcQuery cQry New Alias cAlias
                 
cAlias->(dbGoTop())

If cTipo == 'C'		
	uMaxCod := If(lComplZero,StrZero(cAlias->NEXT_REG,nTam),cValToChar(cAlias->NEXT_REG))
Else
	uMaxCod := cAlias->NEXT_REG
EndIf

cAlias->(dbCloseArea())

Return uMaxCod

************************************************************************************************************************************

Static Function DtoC_4DigAno(dDataConv)
                               
Local cDataRet 

Default dDataConv := dDataBase      

cDataRet := DtoS(dDataConv)
cDataRet := Right(cDataRet,2) + '/' + Substr(cDataRet,5,2) + '/' + Left(cDataRet,4)

Return cDataRet

************************************************************************************************************************************
      
Static Function InfoUsr(cLogins, cSep)

Local aInfoUsr	:= {}
Local aCab		:= {"Bloq.","Codigo","Login","Nome","Data de validade","Departamento","Cargo","Ramal","E-mail","Acessos simultaneos"}
Local aTam		:= {40,50,80,120,50,80,80,50,80,50}
Local oOk      	:= LoadBitMap(GetResources(),"BR_VERDE")
Local oNo      	:= LoadBitMap(GetResources(),"BR_VERMELHO")
Local i 		:= 1

Default cSep 	:= ','
                     
If !empty(cLogins)

	aBuffer := StrTokArr(cLogins, cSep)
	
	For i := 1 to len(aBuffer) 
		PswOrder(1)
		If PswSeek(aBuffer[i], .T. )	
		   	aInfo := PswRet()                                
		   	//Bloqueado, codigo, login, nome, data de validade, departamento, cargo, ramal, e-mail, acessos simultaneos 
			aAdd(aInfoUsr,{aInfo[1][17],aBuffer[i],aInfo[1][2],Upper(aInfo[1][4]),aInfo[1][6],aInfo[1][12],aInfo[1][13],aInfo[1][20],aInfo[1][14],aInfo[1][15]}) 
		EndIf     
	Next 
	   
	cCadastro := "InformaÁıes de usu·rios Protheus"
	
	oDlg := MSDialog():New(0,0,490,850,"InformaÁıes de usu·rios Protheus",,,.F.,,,,,,.T.,,,.T. )
	          
		oTBitmap1 		:= TBitmap():New(005,020,260,184,,"",.T.,oDlg,,,.F.,.F.,,,.F.,,.T.,,.F.) 
		oTBitmap1:Load("BR_VERDE")
		oTBitmap1:lAutoSize := .T.  
		
		oSay1      := TSay():New( 005,035,{||"Usu·rio ativo"},oDlg,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,236,016)
		
		oTBitmap2 		:= TBitmap():New(015,020,260,184,,"",.T.,oDlg,,,.F.,.F.,,,.F.,,.T.,,.F.) 
		oTBitmap2:Load("BR_VERMELHO")
		oTBitmap2:lAutoSize := .T. 
	
		oSay2      := TSay():New( 015,035,{||"Usu·rio bloqueado"},oDlg,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,236,016)
		
		oBrowse := TcBrowse():New(030,010,410,190,,aCab,aTam,oDlg,,,,,{|| },,,,,,,.F.,,.T.,,.F.,,, )
	    oBrowse:SetArray(aInfoUsr) 
	    
	    oBrowse:bLine := {||{If(!aInfoUsr[oBrowse:nAt,1],oOk,oNo)		,;
							aInfoUsr[oBrowse:nAt, 2]  					,;
							aInfoUsr[oBrowse:nAt, 3] 				 	,;
							aInfoUsr[oBrowse:nAt, 4]  					,;
							aInfoUsr[oBrowse:nAt, 5]					,;
							aInfoUsr[oBrowse:nAt, 6]					,;
							aInfoUsr[oBrowse:nAt, 7]					,;
							aInfoUsr[oBrowse:nAt, 8]					,;
							aInfoUsr[oBrowse:nAt, 9]					,;
							aInfoUsr[oBrowse:nAt,10]  					}}   
		
		oBrowse:nScrollType := 1 // Scroll VCR        
	    
	  	oSBtn1     := SButton():New(230,365,1,{||lConfirm := .T.,oDlg:End()}	,oDlg,,"", )
		oSBtn2     := SButton():New(230,395,2,{||oDlg:End()}					,oDlg,,"", )
	
	oDlg:Activate(,,,.T.)	  

Else
	Alert('Informe pelo menos 1 cÛdigo de usu·rio!')
EndIf
	
Return

************************************************************************************************************************************

Static Function lVarExist(cNomVar) 

Local lExiste := .T.

TRY 
	empty(&cNomVar)
CATCH
	lExiste := .F.
ENDCATCH

Return lExiste

************************************************************************************************************************************

//⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
//≥Parametro: Retorno da funcao FError() ≥
//¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

Static Function cDesFerror(nErro)
                
Local cDescErro := ""
Local aDescErro	:= {}
Local cNumErro 	:= cValToChar(nErro)

aAdd(aDescErro,{  "-1","    ","Operation failed or undefined error                           "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "0","    ","Operation sucess                                              "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "1","    ","(Unexpected Error Code)                                       "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "2","Unix","Path/File not found                                           "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "3","    ","(Unexpected Error Code)                                       "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "4","Unix","Bad File Descriptor                                           "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "5","Unix","Too many symbolic links encountered while traversing the path."})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "6","Unix","Bad address.                                                  "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "7","Unix","Out of memory.                                                "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "8","Unix","No such device or address.                                    "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "9","Win ","The endpoint mapper database could not be created.            "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
aAdd(aDescErro,{   "10"," Win        "," The operation cannot be performed.                        "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
aAdd(aDescErro,{   "11"," Win        "," The entry is invalid.                                     "})                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
aAdd(aDescErro,{   "12"," Win        "," There are no more endpoints available from the endpoint mapper.                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "13"," Win / Unix "," Access is denied.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "14"," Win        "," The referenced account is currently disabled and cannot be logged on to.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})      
aAdd(aDescErro,{   "15"," Win        "," The user's account has expired.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "16"," Win        "," The referenced account is currently locked out and may not be logged on to.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})      
aAdd(aDescErro,{   "17"," Win        "," Indicates a referenced user name and authentication information are valid, but some user account restriction has prevented successful authentication (such as time-of-day restrictions).                                                                                                                                                                                                                                                                                                                                           "})      
aAdd(aDescErro,{   "18"," Win        "," Active connections still exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "19"," Win        "," A network adapter hardware error occurred.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "20"," Win        "," The network transport endpoint already has an address associated with it.                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "21"," Win        "," An address has not yet been associated with the network endpoint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "22"," Win        "," The specified alias already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})      
aAdd(aDescErro,{   "23"," Win        "," When a block of memory is allotted for future updates, such as the memory allocated to hold discretionary access control and primary group information, successive updates may exceed the amount of memory originally allotted. Since quota may already have been charged to several processes that have handles of the object, it is not reasonable to alter the size of the allocated memory. Instead, a request that requires more memory than has been allotted must fail and the ERROR_ALLOTTED_SPACE_EXCEEDED error returned."})      
aAdd(aDescErro,{   "24"," Win        "," The local device name is already in use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})      
aAdd(aDescErro,{   "25"," Win        "," Attempt to create file that already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})      
aAdd(aDescErro,{   "26"," Win        "," An attempt was made to perform an initialization operation when initialization has already been completed.                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "27"," Win        "," The service is already registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "28"," Win        "," The system is currently running with the last-known-good configuration.                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})      
aAdd(aDescErro,{   "29"," Win        "," The specified Printer handle is already being waited on                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})      
aAdd(aDescErro,{   "30"," Win        "," The specified program is not a Windows or MS-DOS program.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "31"," Win        "," The storage control blocks were destroyed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "32"," Win        "," Arithmetic result exceeded 32-bits.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})      
aAdd(aDescErro,{   "33"," Win        "," The file system does not support atomic changing of the lock type.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "34"," Win        "," The operating system cannot run this application program.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "35"," Win        "," The argument string passed to DosExecPgm is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})      
aAdd(aDescErro,{   "36"," Win        "," The device does not recognize the command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "37"," Win        "," Indicates a security descriptor is not in the required format (absolute or self-relative).                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "38"," Win        "," The network resource type is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})      
aAdd(aDescErro,{   "39"," Win        "," The specified device name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})      
aAdd(aDescErro,{   "40"," Win        "," The specified driver is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})      
aAdd(aDescErro,{   "41"," Win        "," The system does not support the requested command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "42"," Win        "," The environment is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})      
aAdd(aDescErro,{   "43"," Win        "," 1 is not a valid Windows-based application.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})      
aAdd(aDescErro,{   "44"," Win        "," An attempt was made to load a program with an incorrect format.                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "45"," Win        "," A specified impersonation level is invalid. Also used to indicate a required impersonation level was not provided.                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "46"," Win        "," Indicates that an attempt to build either an inherited ACL or ACE did not succeed. One of the more probable causes is the replacement of a CreatorId with an SID that didn't fit into the ACE or ACL.                                                                                                                                                                                                                                                                                                                              "})      
aAdd(aDescErro,{   "47"," Win        "," The program issued a command but the command length is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "48"," Win        "," The logon session is not in a state consistent with the requested operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})      
aAdd(aDescErro,{   "49"," Win        "," The network name cannot be found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "50"," Win        "," The specified server cannot perform the requested operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})      
aAdd(aDescErro,{   "51"," Win        "," The network path was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "52"," Win / Unix "," The specified path and/or name is invalid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "53"," Win        "," The pipe state is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "54"," Win        "," The network connection profile is damaged.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "55"," Win        "," The specified network provider name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "56"," Win        "," The remote adapter is not compatible.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})      
aAdd(aDescErro,{   "57"," Win        "," The address for the thread ID is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})      
aAdd(aDescErro,{   "58"," Win        "," The type of token object is inappropriate for its attempted use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})      
aAdd(aDescErro,{   "59"," Win        "," The system cannot find the specified device.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})      
aAdd(aDescErro,{   "60"," Win        "," The specified user name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})      
aAdd(aDescErro,{   "61"," Win        "," The requested validation information class is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})      
aAdd(aDescErro,{   "62"," Win        "," The configuration registry database is damaged.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "63"," Win        "," The configuration registry key is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "64"," Win        "," The beginning of the tape or partition was encountered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})      
aAdd(aDescErro,{   "65"," Win        "," The current boot has already been accepted for use as the last-known-good control set.                                                                                                                                                                                                                                                                                                                                                                                                                                             "})      
aAdd(aDescErro,{   "66"," Win        "," The pipe was ended.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})      
aAdd(aDescErro,{   "67"," Win        "," The file name is too long.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "68"," Win        "," The I/O bus was reset.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})      
aAdd(aDescErro,{   "69"," Win        "," The requested resource is in use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "70"," Win        "," The system cannot perform a JOIN or SUBST at this time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})      
aAdd(aDescErro,{   "71"," Win        "," The Application Program Interface (API) entered will only work in Windows/NT mode.                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "72"," Win        "," Cannot complete function for some reason.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "73"," Win        "," The local WINS can not be deleted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "74"," Win        "," A lock request was not outstanding for the supplied cancel region.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "75"," Win        "," The operation was cancelled by the user.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})      
aAdd(aDescErro,{   "76"," Win        "," The Copy API cannot be used.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})      
aAdd(aDescErro,{   "77"," Win        "," Cannot find window class.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "78"," Win        "," Indicates that an attempt was made to impersonate via a named pipe was not yet read from.                                                                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{   "79"," Win        "," The directory or file cannot be created.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})      
aAdd(aDescErro,{   "80"," Win        "," Unable to open the network connection profile.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})      
aAdd(aDescErro,{   "81"," Win        "," Indicates a domain controller could not be contacted or that objects within the domain are protected and necessary information could not be retrieved.                                                                                                                                                                                                                                                                                                                                                                             "})      
aAdd(aDescErro,{   "82"," Win        "," A mandatory group cannot be disabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})      
aAdd(aDescErro,{   "83"," Win        "," An attempt was made to open an anonymous level token. Anonymous tokens cannot be opened.                                                                                                                                                                                                                                                                                                                                                                                                                                           "})      
aAdd(aDescErro,{   "84"," Win        "," The configuration registry key cannot be opened.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})      
aAdd(aDescErro,{   "85"," Win        "," The configuration registry key cannot be read.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})      
aAdd(aDescErro,{   "86"," Win        "," The configuration registry key cannot be written.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "87"," Win        "," An attempt was made to create a stable subkey under a volatile parent key.                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "88"," Win        "," The %1 application cannot be run in Windows mode.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})      
aAdd(aDescErro,{   "89"," Win        "," Child windows can't have menus.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})      
aAdd(aDescErro,{   "90"," Win        "," Circular service dependency was specified.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})      
aAdd(aDescErro,{   "91"," Win        "," Class already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})      
aAdd(aDescErro,{   "92"," Win        "," Class does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})      
aAdd(aDescErro,{   "93"," Win        "," Class still has open windows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})      
aAdd(aDescErro,{   "94"," Win        "," Thread doesn't have clipboard open.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})      
aAdd(aDescErro,{   "95"," Win        "," The requested clipping operation is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})      
aAdd(aDescErro,{   "96"," Win        "," The paging file is too small for this operation to complete.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})      
aAdd(aDescErro,{   "97"," Win        "," The network connection was aborted by the local system.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})      
aAdd(aDescErro,{   "98"," Win        "," An invalid operation was attempted on an active network connection.                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})      
aAdd(aDescErro,{   "99"," Win        "," A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.                                                                                                                                                                                                                                                                                                                                                                                          "})      
aAdd(aDescErro,{  "100"," Win        "," An operation was attempted on a non-existent network connection.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "101"," Win        "," The remote system refused the network connection.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "102"," Win        "," The device is not currently connected but is a remembered connection.                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "103"," Win        "," Return that wants caller to continue with work in progress.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "104"," Win        "," Control ID not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "105"," Win        "," A serial I/O operation completed because the time-out period expired. (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "106"," Win        "," Data error (cyclic redundancy check).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "107"," Win        "," The directory cannot be removed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "108"," Win        "," The database specified does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "109"," Win        "," Invalid HDC passed to ReleaseDC.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "110"," Win        "," An error occurred in sending the command to the application.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "111"," Win        "," A stop control has been sent to a service which other running services are dependent on.                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "112"," Win        "," Cannot destroy object created by another thread.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "113"," Win        "," The specified network resource is no longer available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "114"," Win        "," An attempt was made to remember a device that was previously remembered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "115"," Win        "," The device is in use by an active process and cannot be disconnected.                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "116"," Win        "," Tape partition information could not be found when loading a tape.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "117"," Win        "," The account specified for this service is different from the account specified for other services running in the same process.                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "118"," Win / Unix "," The directory is not empty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "119"," Win        "," The directory is not a subdirectory of the root directory.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "120"," Win        "," Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "121"," Win / Unix "," The directory name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "122"," Win        "," The segment is already discarded and cannot be locked.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "123"," Win        "," Program stopped because alternate disk was not inserted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "124"," Win        "," The disk structure is damaged and nonreadable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "125"," Win        "," There is not enough space on the disk.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "126"," Win        "," While accessing the hard disk, a disk operation failed even after retries.                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "127"," Win        "," While accessing the hard disk, a recalibrate operation failed, even after retries.                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "128"," Win        "," While accessing the hard disk, a disk controller reset was needed, but even that failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "129"," Win        "," A DLL initialization routine failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "130"," Win        "," One of the library files needed to run this application cannot be found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "131"," Win        "," Could not find the domain controller for this domain.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "132"," Win        "," The specified domain already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "133"," Win        "," An attempt to exceed the limit on the number of domains per server for this release.                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "134"," Win        "," The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "135"," Win        "," The disk is in use or locked by another process.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "136"," Win        "," The workgroup or domain name is already in use by another computer on the network.                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "137"," Win        "," A duplicate name exists on the network.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "138"," Win        "," The name is already in use as either a service name or a service display name.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "139"," Win        "," The operating system cannot run this application program.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "140"," Win        "," Access to the EA is denied.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "141"," Win        "," The EA file on the mounted file system is damaged.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "142"," Win        "," The EAs are inconsistent.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "143"," Win        "," The EA table in the EA file on the mounted file system is full.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "144"," Win        "," The EAs did not fit in the buffer.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "145"," Win        "," The mounted file system does not support extended attributes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "146"," Win        "," The physical end of the tape has been reached.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "147"," Win        "," The system could not find the environment option entered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "148"," Win        "," Physical end of tape encountered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "149"," Win        "," No event log file could be opened, so the event logging service did not start.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "150"," Win        "," The event log file has changed between reads.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "151"," Win        "," One of the Eventlog logfiles is damaged.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "152"," Win        "," An exception occurred in the service when handling the control request.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "153"," Win        "," The exclusive semaphore is owned by another process.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "154"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "155"," Win        "," An extended error has occurred.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "156"," Win        "," Fail on INT 24.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "157"," Win        "," The service process could not connect to the service controller.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "158"," Win        "," The file or directory is damaged and nonreadable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "159"," Win / Unix "," The file exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "160"," Win / Unix "," The volume for a file was externally altered and the opened file is no longer valid.                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "161"," Win / Unix "," The system cannot find the file specified.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "162"," Win        "," A tape access reached a filemark.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "163"," Win / Unix "," The file name or extension is too long.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "164"," Win        "," The floppy disk controller returned inconsistent results in its registers.                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "165"," Win        "," No ID address mark was found on the floppy disk.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "166"," Win        "," Mismatch between the floppy disk sector ID field and the floppy disk controller track address.                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "167"," Win        "," The floppy disk controller reported an error that is not recognized by the floppy disk driver.                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "168"," Win        "," The backup failed. Check the directory that you are backing the database to.                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "169"," Win        "," The requested operation cannot be performed in full-screen mode.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "170"," Win        "," A device attached to the system is not functioning.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "171"," Win        "," Indicates generic access types were contained in an access mask that should already be mapped to non-generic access types.                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "172"," Win        "," This hook can only be set globally.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "173"," Win        "," The network connection was gracefully closed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "174"," Win        "," The specified group already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "175"," Win        "," The disk is full.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "176"," Win        "," Reached End Of File.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "177"," Win        "," Cannot set non-local hook without an module handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "178"," Win        "," Hook is not installed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "179"," Win        "," Hook type not allowed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "180"," Win        "," The remote system is not reachable by the transport.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "181"," Win        "," Hotkey is already registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "182"," Win        "," Hotkey is not registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "183"," Win        "," All DeferWindowPos HWNDs must have same parent.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "184"," Win        "," When trying to update a password, this return status indicates the value provided for the new password contains values not allowed in passwords.                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "185"," Win        "," The backup failed. Was a full backup done before ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "186"," Win        "," The network address could not be used for the operation requested.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "187"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "188"," Win        "," The data area passed to a system call is too small.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "189"," Win        "," This error indicates the requested operation cannot be completed due to a catastrophic media failure or on-disk data structure corruption.                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "190"," Win        "," The Local Security Authority (LSA) database contains in internal inconsistency.                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "191"," Win        "," This error indicates the SAM server has encounterred an internal consistency error in its database. This catastrophic failure prevents further operation of SAM.                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "192"," Win        "," Invalid accelerator-table handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "193"," Win        "," The access code is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "194"," Win        "," The name provided is not a properly formed account name.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "195"," Win        "," Indicates the ACL structure is not valid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "196"," Win        "," Attempt to access invalid address.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "197"," Win        "," Cannot request exclusive semaphores at interrupt time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "198"," Win        "," The storage control block address is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "199"," Win        "," When accessing a new tape of a multivolume partition, the current block size is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "200"," Win        "," The IOCTL call made by the application program is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "201"," Win        "," Invalid Message, combo box doesn't have an edit control.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "202"," Win        "," The format of the specified computer name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "203"," Win        "," The cursor handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "204"," Win        "," The data is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "205"," Win        "," The specified datatype is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "206"," Win        "," One of the library files needed to run this application is damaged.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "207"," Win        "," The format of the specified domain name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "208"," Win        "," Indicates the requested operation cannot be completed with the domain in its present role.                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "209"," Win        "," Indicates the domain is in the wrong state to perform the desired operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "210"," Win        "," The system cannot find the specified drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "211"," Win        "," The DeferWindowPos handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "212"," Win        "," The specified EA handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "213"," Win        "," The specified EA name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "214"," Win        "," Height must be less than 256.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "215"," Win        "," The Environment specified is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "216"," Win        "," The number of specified semaphore events is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "217"," Win        "," The format of the specified event name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "218"," Win        "," 1 cannot be run in Windows/NT mode.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "219"," Win        "," The filter proc is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "220"," Win        "," The flag passed is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "221"," Win        "," The flags are invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "222"," Win        "," The function is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "223"," Win        "," The specified attributes are invalid, or incompatible with the attributes for the group as a whole.                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "224"," Win        "," The format of the specified group name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "225"," Win        "," The GW_* command is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "226"," Win        "," The specified Form name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "227"," Win        "," The specified Form size is invalid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "228"," Win        "," The internal file identifier is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "229"," Win        "," The hook filter type is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "230"," Win        "," The hook handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "231"," Win        "," The icon handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "232"," Win        "," The value provided is an invalid value for an identifier authority.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "233"," Win        "," The index is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "234"," Win        "," Invalid keyboard layout handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "235"," Win        "," The message for single-selection list box is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "236"," Win        "," The system call level is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "237"," Win        "," The list is not correct.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "238"," Win        "," The user account has time restrictions and cannot be logged onto at this time.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "239"," Win        "," Indicates an invalid value has been provided for LogonType has been requested.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "240"," Win        "," A new member could not be added to an alias because the member has the wrong account type.                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "241"," Win        "," The menu handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "242"," Win        "," Window can't handle sent message.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "243"," Win        "," The format of the specified message destination is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "244"," Win        "," The format of the specified message name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "245"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "246"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "247"," Win        "," The message box style is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "248"," Win        "," The file name, directory name, or volume label is syntactically incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "249"," Win        "," The format of the specified network name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "250"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "251"," Win        "," Indicates a particular Security ID cannot be assigned as the owner of an object.                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "252"," Win        "," The parameter is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "253"," Win        "," The specified network password is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "254"," Win        "," The format of the specified password is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "255"," Win        "," The pixel format is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "256"," Win        "," Indicates a particular Security ID cannot be assigned as the primary group of an object.                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "257"," Win        "," The specified print monitor does not have the required functions.                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "258"," Win        "," The printer command is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "259"," Win        "," The printer name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "260"," Win        "," The state of the Printer is invalid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "261"," Win        "," The specified priority is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "262"," Win        "," Scrollbar range greater than 0x7FFF.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "263"," Win        "," Indicates the SECURITY_DESCRIPTOR structure is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "264"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "265"," Win        "," The system detected a segment number that is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "266"," Win        "," The specified separator file is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "267"," Win        "," Indicates the Sam Server was in the wrong state to perform the desired operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "268"," Win        "," The account name is invalid or does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "269"," Win        "," The requested control is not valid for this service                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "270"," Win        "," The specified service database lock is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "271"," Win        "," The format of the specified service name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "272"," Win        "," The format of the specified share name is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "273"," Win        "," The ShowWindow command is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "274"," Win        "," Indicates the SID structure is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "275"," Win        "," The signal being posted is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "276"," Win        "," The SPI_* parameter is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "277"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "278"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "279"," Win        "," Indicates the sub-authority value is invalid for the particular use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "280"," Win        "," The target internal file identifier is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "281"," Win        "," The thread ID is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "282"," Win        "," The specified time is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "283"," Win        "," The supplied user buffer is invalid for the requested operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "284"," Win        "," The verify-on-write switch parameter value is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "285"," Win        "," The window handle invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "286"," Win        "," The window style or class attribute is invalid for this operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "287"," Win        "," The user account is restricted and cannot be used to log on from the source workstation.                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "288"," Win        "," The request could not be performed because of an I/O device error.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "289"," Win        "," Overlapped IO event not in signaled state.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "290"," Win        "," Overlapped IO operation in progress.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "291"," Win        "," The operating system is not presently configured to run this application.                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "292"," Win        "," Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other device that uses that IRQ was already opened.                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "293"," Win        "," Not enough resources are available to process this command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "294"," Win        "," A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "295"," Win        "," An attempt was made to use a JOIN or SUBST command on a drive that is already joined.                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "296"," Win        "," The path specified is being used in a substitute.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "297"," Win        "," An attempt was made to join or substitute a drive for which a directory on the drive is the target of a previous substitute.                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "298"," Win        "," An attempt was made to use a JOIN or SUBST command on a drive already substituted.                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "299"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "300"," Win        "," The system tried to join a drive to a directory on a joined drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "301"," Win        "," The system tried to join a drive to a directory on a substituted drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "302"," Win        "," The journal hook is already installed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "303"," Win        "," Illegal operation attempted on a registry key that has been marked for deletion.                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "304"," Win        "," An attempt was made to create a symbolic link in a registry key that already has subkeys or values.                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "305"," Win        "," The volume label entered exceeds the 11 character limit. The first 11 characters were written to disk. Any characters that exceeded the 11 character limit were automatically deleted.                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "306"," Win        "," Indicates the requested operation would disable or delete the last remaining administration account. This is not allowed to prevent creating a situation where the system will not be administrable.                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "307"," Win        "," This list box doesn't support tab stops.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "308"," Win        "," The service being accessed is licensed for a particular number of connections. No more connections can be made to the service at this time because there are already as many connections as the service can accept.                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "309"," Win        "," List box ID not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "310"," Win        "," An attempt was made to change a user password in the security account manager without providing the required LM cross-encrypted password.                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "311"," Win        "," A user session key was requested for a local RPC connection. The session key returned is a constant value and not unique to this connection.                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "312"," Win        "," Attempt to lock a region of a file failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "313"," Win        "," The process cannot access the file because another process has locked a portion of the file.                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "314"," Win        "," The segment is locked and cannot be reallocated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "315"," Win        "," The event log file is full.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "316"," Win        "," Attempting to login during an unauthorized time of day for this account.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "317"," Win        "," The account is not authorized to login from this station.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "318"," Win        "," The attempted logon is invalid. This is due to either a bad user name or authentication information.                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "319"," Win        "," A requested type of logon, such as Interactive, Network, or Service, is not granted by the target system's local security policy. The system administrator can grant the required form of logon.                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "320"," Win        "," The logon session ID is already in use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "321"," Win        "," An attempt was made to start a new session manager or LSA logon session with an ID already in use.                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "322"," Win        "," A user has requested a type of logon, such as interactive or network, that was not granted. An administrator has control over who may logon interactively and through the network.                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "323"," Win        "," Indicates there are no more LUID to allocate.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "324"," Win        "," The base address or the file offset specified does not have the proper alignment.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "325"," Win        "," No more threads can be created in the system.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "326"," Win        "," Media in drive may have changed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "327"," Win        "," The specified account name is not a member of the alias.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "328"," Win        "," The specified user account is already in the specified group account. Also used to indicate a group can not be deleted because it contains a member.                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "329"," Win        "," The specified account name is not a member of the alias.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "330"," Win        "," The specified user account is not a member of the specified group account.                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "331"," Win        "," Indicates a member cannot be removed from a group because the group is currently the member's primary group.                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "332"," Win        "," A menu item was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "333"," Win        "," The global filename characters * or ? are entered incorrectly, or too many global filename characters are specified.                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "334"," Win        "," The requested metafile operation is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "335"," Win        "," The specified module cannot be found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "336"," Win        "," More data is available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "337"," Win        "," A serial I/O operation was completed by another write to the serial port. (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "338"," Win        "," The system cannot find message for message number 0x%1 in message file for %2.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "339"," Win        "," An attempt was made to move the file pointer before the beginning of the file.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "340"," Win        "," Can't nest calls to LoadModule.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "341"," Win        "," An attempt was made to logon, but the network logon service was not started.                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "342"," Win        "," A write fault occurred on the network.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "343"," Win        "," The specified network name is no longer available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "344"," Win        "," Network access is denied.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "345"," Win        "," The network is busy.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "346"," Win        "," The remote network is not reachable by the transport.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "347"," Win        "," No application is associated with the specified file for this operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "348"," Win        "," The list of servers for this workgroup is not currently available                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "349"," Win        "," Pipe close in progress.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "350"," Win        "," During a tape access, the end of the data marker was reached.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "351"," Win        "," An attempt was made to operate on an impersonation token by a thread was not currently impersonating a client.                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "352"," Win        "," Indicates an ACL contains no inheritable components.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "353"," Win        "," System could not allocate required space in a registry log.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "354"," Win        "," The account used is an interdomain trust account. Use your normal user account or remote user account to access this server.                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "355"," Win        "," The account used is an server trust account. Use your normal user account or remote user account to access this server.                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "356"," Win        "," There are currently no logon servers available to service the logon request.                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "357"," Win        "," The account used is a workstation trust account. Use your normal user account or remote user account to access this server.                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "358"," Win        "," Tape query failed because of no media in drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "359"," Win        "," No more local devices.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "360"," Win        "," There are no more files.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "361"," Win        "," No more data is available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "362"," Win        "," No more internal file identifiers available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "363"," Win        "," No network provider accepted the given network path.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "364"," Win        "," The network is not present or not started.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "365"," Win        "," The system cannot start another process at this time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "366"," Win        "," No system quota limits are specifically set for this account.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "367"," Win        "," Window does not have scroll bars.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "368"," Win        "," Indicates an attempt was made to operate on the security of an object that does not have security associated with it.                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "369"," Win        "," An attempt to abort the shutdown of the system failed because no shutdown was in progress.                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "370"," Win        "," No process in the command subtree has a signal handler.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "371"," Win        "," Space to store the file waiting to be printed is not available on the server.                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "372"," Win        "," The specified alias does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "373"," Win        "," The specified domain does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "374"," Win        "," The specified group does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "375"," Win        "," A specified logon session does not exist. It may already have been terminated.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "376"," Win        "," A new member cannot be added to an alias because the member does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "377"," Win        "," A specified authentication package is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "378"," Win        "," A specified privilege does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "379"," Win        "," The specified user does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "380"," Win        "," Window does not have system menu.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "381"," Win        "," Insufficient system resources exist to complete the requested service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "382"," Win        "," An attempt was made to reference a token that does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "383"," Win        "," The workstation does not have a trust secret.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "384"," Win        "," The domain controller does not have an account for this workstation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "385"," Win        "," No mapping for the Unicode character exists in the target multi-byte code page.                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "386"," Win        "," There is no user session key for the specified logon session.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "387"," Win        "," The disk has no volume label.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "388"," Win        "," No wildcard characters found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "389"," Win        "," Invalid access to memory location.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "390"," Win        "," DefMDIChildProc called with a non-MDI child window.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "391"," Win        "," None of the information to be mapped has been translated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "392"," Win        "," Insufficient system resources exist to complete the requested service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "393"," Win        "," Indicates not all privileges referenced are assigned to the caller. This allows, for example, all privileges to be disabled without having to know exactly which privileges are assigned.                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "394"," Win        "," The operation being requested was not performed because the user has not been authenticated.                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "395"," Win        "," Window is not a child window.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "396"," Win        "," This network connection does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "397"," Win        "," Cannot enumerate a non-container.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "398"," Win        "," The specified disk cannot be accessed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "399"," Win        "," Not enough storage is available to process this command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "400"," Win        "," Not enough quota is available to process this command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "401"," Win        "," Not enough server storage is available to process this command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "402"," Win        "," The system attempted to delete the JOIN of a drive not previously joined.                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "403"," Win        "," The segment is already unlocked.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "404"," Win        "," The operation being requested was not performed because the user has not logged on to the network.                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "405"," Win        "," The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "406"," Win        "," Attempt to release mutex not owned by caller.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "407"," Win        "," The drive is not ready.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "408"," Win        "," The system attempted to load or restore a file into the registry, and the specified file is not in the format of a registry file.                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "409"," Win        "," The system cannot move the file to a different disk drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "410"," Win        "," The system attempted to delete the substitution of a drive not previously substituted.                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "411"," Win        "," The network request is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "412"," Win        "," This indicates that a notify change request is being completed and the information is not being returned in the caller's buffer. The caller now needs to enumerate the files to find the changes.                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "413"," Win        "," An attempt was made to change a user password in the security account manager without providing the necessary NT cross-encrypted password.                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "414"," Win        "," The Windows NT password is too complex to be converted to a Windows-networking password. The Windows-networking password returned is a NULL string.                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "415"," Win        "," The specified program requires a newer version of Windows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "416"," Win        "," The system cannot open the specified device or file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "417"," Win        "," There are open files or requests pending on this connection.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "418"," Win        "," The I/O operation was aborted due to either thread exit or application request.                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "419"," Win        "," The printer is out of paper.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "420"," Win        "," Storage to process this request is not available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "421"," Win        "," Not enough storage is available to complete this operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "422"," Win        "," Insufficient system resources exist to complete the requested service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "423"," Win        "," Insufficient quota to complete the requested service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "424"," Win        "," Only part of a Read/WriteProcessMemory request was completed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "425"," Win        "," Tape could not be partitioned.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "426"," Win        "," The user account's password has expired.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "427"," Win        "," The user must change his password before he logs on the first time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "428"," Win        "," When trying to update a password, this status indicates that some password update rule was violated. For example, the password may not meet length criteria.                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "429"," Win        "," The specified path cannot be used at this time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "430"," Win        "," The system cannot find the specified path.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "431"," Win        "," All pipe instances busy.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "432"," Win        "," There is a process on other end of the pipe.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "433"," Win        "," Waiting for a process to open the other end of the pipe.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "434"," Win        "," No process on other end of pipe.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "435"," Win        "," Pop-up menu already active.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "436"," Win        "," No service is operating at the destination network endpoint on the remote system.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "437"," Win        "," A potential deadlock condition has been detected.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "438"," Win        "," File waiting to be printed was deleted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "439"," Win        "," The specified print monitor has already been installed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "440"," Win        "," The specified print monitor is currently in use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "441"," Win        "," The specified print processor has already been installed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "442"," Win        "," The printer already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "443"," Win        "," The specified Printer has been deleted                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "444"," Win        "," The specified printer driver is already installed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "445"," Win        "," The specified printer driver is currently in use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "446"," Win        "," The requested operation is not allowed when there are jobs queued to the printer.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "447"," Win        "," The printer queue is full.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "448"," Win        "," Using private DIALOG window words.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "449"," Win        "," A required privilege is not held by the client.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "450"," Win        "," The specified procedure could not be found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "451"," Win        "," The process terminated unexpectedly.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "452"," Win        "," The remote system does not support the transport protocol.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "453"," Win        "," The system cannot read from the specified device.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "454"," Win        "," The name does not exist in the WINS database.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "455"," Win        "," The specified printer or disk device has been paused.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "456"," Win        "," The redirector is in use and cannot be unloaded.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "457"," Win        "," The registry is damaged. The structure of one of the files that contains registry data is damaged, or the system's in memory image of the file is damaged, or the file could not be recovered because its alternate copy or log was absent or damaged.                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "458"," Win        "," The registry initiated an I/O operation that had an unrecoverable failure. The registry could not read in, or write out, or flush, one of the files that contain the system's image of the registry.                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "459"," Win        "," One of the files containing the system's registry data had to be recovered by use of a log or alternate copy. The recovery succeeded.                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "460"," Win        "," The operating system cannot run %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "461"," Win        "," The remote computer is not available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "462"," Win        "," An attempt was made to establish a session to a LAN Manager server, but there are already too many sessions established to that server.                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "463"," Win        "," The network request was not accepted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "464"," Win        "," The request was aborted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "465"," Win        "," The specified image file did not contain a resource section.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "466"," Win        "," The specified resource language ID cannot be found in the image file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "467"," Win        "," The specified resource name can not be found in the image file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "468"," Win        "," The specified resource type can not be found in the image file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "469"," Win        "," The operation could not be completed.  A retry should be performed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "470"," Win        "," Indicates two revision levels are incompatible.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "471"," Win        "," The ring 2 stack is in use.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "472"," Win        "," The code segment cannot be greater than or equal to 64KB.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "473"," Win        "," The specified program was written for an older version of Windows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "474"," Win        "," Replication with a non-configured partner is not allowed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "475"," Win        "," Indicates an error occurred during a registry transaction commit. The database has been left in an unknown state. The state of the registry transaction is left as COMMITTING. This status value is returned by the runtime library (RTL) registry transaction package (RXact).                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "476"," Win        "," Indicates that the transaction state of a registry sub-tree is incompatible with the requested operation. For example, a request has been made to start a new transaction with one already in progress, or a request to apply a transaction when one is not currently in progress. This status value is returned by the runtime library (RTL) registry transaction package (RXact).                                                                                                                                                      "})
aAdd(aDescErro,{  "477"," Win        "," The system cannot join or substitute a drive to or for a directory on the same drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "478"," Win        "," Screen already locked.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "479"," Win        "," The length of a secret exceeds the maximum length allowed. The length and number of secrets is limited to satisfy the United States State Department export restrictions.                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "480"," Win        "," The drive cannot find the requested sector.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "481"," Win        "," The drive cannot locate a specific area or track on the disk.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "482"," Win        "," The file pointer cannot be set on the specified device or file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "483"," Win        "," The semaphore is set and cannot be closed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "484"," Win        "," The specified system semaphore name was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "485"," Win        "," The previous ownership of this semaphore has ended.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "486"," Win        "," The semaphore timeout period has expired.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "487"," Win        "," Insert the disk for drive 1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "488"," Win        "," No serial device was successfully initialized. The serial driver will unload.                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "489"," Win        "," The GUID allocation server is already disabled at the moment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "490"," Win        "," The server is in use and cannot be unloaded.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "491"," Win        "," The GUID allocation server is already enabled at the moment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "492"," Win        "," An instance of the service is already running.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "493"," Win        "," The service cannot accept control messages at this time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "494"," Win        "," The service database is locked.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "495"," Win        "," The dependency service does not exist or has been marked for deletion.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "496"," Win        "," The dependency service or group failed to start.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "497"," Win        "," The specified service is disabled and cannot be started.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "498"," Win        "," The specified service does not exist as an installed service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "499"," Win        "," The specified service already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "500"," Win        "," The service did not start due to a logon failure.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "501"," Win        "," The specified service has been marked for deletion.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "502"," Win        "," No attempts to start the service have been made since the last boot.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "503"," Win        "," A thread could not be created for the service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "504"," Win        "," The service has not been started.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "505"," Win        "," The specified service does not exist.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "506"," Win        "," The service did not respond to the start or control request in a timely fashion.                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "507"," Win        "," The service has returned a service-specific error code.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "508"," Win        "," After starting, the service hung in a start-pending state.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "509"," Win        "," The credentials supplied conflict with an existing set of credentials.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "510"," Win        "," The system BIOS failed an attempt to change the system power state.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "511"," Win        "," An attempt to change the system power state was vetoed by another application or driver.                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "512"," Win        "," LB_SETCOUNT sent to non-lazy list box.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "513"," Win        "," A tape access reached a setmark.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "514"," Win        "," Too many files opened for sharing.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "515"," Win        "," The remote server is paused or is in the process of being started.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "516"," Win        "," The process cannot access the file because it is being used by another process.                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "517"," Win        "," A system shutdown is in progress.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "518"," Win        "," A signal is already pending.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "519"," Win        "," The recipient process has refused the signal.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "520"," Win        "," Cannot start more than one instance of the specified program.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "521"," Win        "," Some of the information to be mapped has not been translated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "522"," Win        "," Indicates an operation was attempted on a built-in (special) SAM account that is incompatible with built-in accounts. For example, built-in accounts cannot be renamed or deleted.                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "523"," Win        "," The requested operation cannot be performed on the specified group because it is a built-in special group.                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "524"," Win        "," The requested operation cannot be performed on the specified user because it is a built-in special user.                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "525"," Win        "," An AddJob call was not issued.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "526"," Win        "," A StartDocPrinter call was not issued.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "527"," Win        "," The spool file was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "528"," Win        "," Recursion too deep, stack overflowed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "529"," Win        "," The importation from the file failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "530"," Win        "," The system attempted to SUBST a drive to a directory on a joined drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "531"," Win        "," The system attempted to substitute a drive to a directory on a substituted drive.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "532"," Win        "," The operation was successfully completed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "533"," Win        "," The requested operation is successful. Changes will not be effective until the system is rebooted.                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "534"," Win        "," The requested operation is successful. Changes will not be effective until the service is restarted.                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "535"," Win        "," Error accessing paging file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "536"," Win        "," System trace information not specified in your CONFIG.SYS file, or tracing is not allowed.                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "537"," Win        "," The requested transformation operation is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "538"," Win        "," The signal handler cannot be set.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "539"," Win        "," CreateWindow failed, creating top-level window with WS_CHILD style.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "540"," Win        "," An attempt was made to establish a token for use as a primary token but the token is already in use. A token can only be the primary token of one process at a time.                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "541"," Win        "," The network BIOS command limit has been reached.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "542"," Win        "," During a logon attempt, the user's security context accumulated too many security IDs. Remove the user from some groups or aliases to reduce the number of security ids to incorporate into the security context.                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "543"," Win        "," An attempt was made to create more links on a file than the file system supports.                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "544"," Win        "," The number of LUID requested cannot be allocated with a single allocation.                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "545"," Win        "," Too many dynamic link modules are attached to this program or dynamic link module.                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "546"," Win        "," Too many semaphores are already set.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "547"," Win        "," The name limit for the local computer network adapter card exceeded.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "548"," Win        "," The system cannot open the file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "549"," Win        "," Too many posts made to a semaphore.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "550"," Win        "," The maximum number of secrets that can be stored in a single system was exceeded. The length and number of secrets is limited to satisfy the United States State Department export restrictions.                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "551"," Win        "," The semaphore cannot be set again.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "552"," Win        "," Cannot create another system semaphore.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "553"," Win        "," The network BIOS session limit exceeded.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "554"," Win        "," Too many SIDs specified.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "555"," Win        "," Cannot create another thread.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "556"," Win        "," The network logon failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "557"," Win        "," The trust relationship between the primary domain and the trusted domain failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "558"," Win        "," The trust relationship between this workstation and the primary domain failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "559"," Win        "," Attempt to lock the eject media mechanism failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "560"," Win        "," Unload media failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "561"," Win        "," An unexpected network error occurred.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "562"," Win        "," The specified port is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "563"," Win        "," The specified print monitor is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "564"," Win        "," The print processor is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "565"," Win        "," The printer driver is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "566"," Win        "," Indicates an encountered or specified revision number is not one known by the service. The service may not be aware of a more recent revision.                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "567"," Win        "," The disk media is not recognized. It may not be formatted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "568"," Win        "," The volume does not contain a recognized file system. Make sure that all required file system drivers are loaded and the volume is not damaged.                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "569"," Win        "," The specified user already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "570"," Win        "," The requested operation cannot be performed on a file with a user mapped section open.                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "571"," Win        "," The session was canceled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "572"," Win        "," There are no child processes to wait for.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "573"," Win        "," The window is not a combo box.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "574"," Win        "," The window is not a valid dialog window.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "575"," Win        "," Invalid window, belongs to other thread.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "576"," Win        "," WINS encountered an error while processing the command.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "577"," Win        "," Insufficient quota to complete the requested service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "578"," Win        "," The system cannot write to the specified device.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "579"," Win        "," The media is write protected.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "580"," Win        "," The wrong disk is in the drive. Insert %2 (Volume Serial Number: %3) into drive %1.                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "581"," Win        "," When trying to update a password, this return status indicates the value provided as the current password is incorrect.                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "582"," Win        "," Invalid input handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "583"," Win        "," Invalid output handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "584"," Win        "," Input parameter out of acceptable range.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "585"," Win        "," Insufficient memory for LZFile structure.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "586"," Win        "," Bad global handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "587"," Win        "," Corrupt compressed file format.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "588"," Win        "," Out of space for output file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "589"," Win        "," Compression algorithm not recognized.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "590"," Win        "," No error.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "591"," Win        "," The object specified was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "592"," Win        "," The object exporter specified was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "593"," Win        "," The object resolver set specified was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "594"," Win        "," An addressing error occurred in the server.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "595"," Win        "," The server is already listening.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "596"," Win        "," The object UUID already registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "597"," Win        "," The binding does not contain any authentication information.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "598"," Win        "," The binding handle does not contain all required information.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "599"," Win        "," The server was altered while processing this call.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "600"," Win        "," The remote procedure call failed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "601"," Win        "," The remote procedure call failed and did not execute.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "602"," Win        "," A remote procedure call is already in progress for this thread.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "603"," Win        "," The requested operation is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "604"," Win        "," The endpoint cannot be created.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "605"," Win        "," Communications failure.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "606"," Win        "," The endpoint is a duplicate.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "607"," Win        "," The entry already exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "608"," Win        "," The entry is not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "609"," Win        "," A floating point operation at the server caused a divide by zero.                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "610"," Win        "," A floating point overflow occurred at the server.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "611"," Win        "," A floating point underflow occurred at the server.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "612"," Win        "," The group member was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "613"," Win        "," The entry name is incomplete.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "614"," Win        "," The interface was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "615"," Win        "," An internal error occurred in RPC.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "616"," Win        "," The security context is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "617"," Win        "," The binding handle is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "618"," Win        "," The array bounds are invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "619"," Win        "," The endpoint format is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "620"," Win        "," The name syntax is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "621"," Win        "," The network address is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "622"," Win        "," The network options are invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "623"," Win        "," The object universal unique identifier (UUID) is the nil UUID.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "624"," Win        "," The RPC protocol sequence is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "625"," Win        "," The string binding is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "626"," Win        "," The string UUID is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "627"," Win        "," The tag is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "628"," Win        "," The timeout value is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "629"," Win        "," The version option is invalid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "630"," Win        "," The maximum number of calls is too small.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "631"," Win        "," The name service is unavailable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "632"," Win        "," There are no bindings.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "633"," Win        "," There is not a remote procedure call active in this thread.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "634"," Win        "," No security context is available to allow impersonation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "635"," Win        "," No endpoint was found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "636"," Win        "," The binding does not contain an entry name.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "637"," Win        "," There are no more bindings.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "638"," Win        "," There are no more members.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "639"," Win        "," No principal name registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "640"," Win        "," There are no protocol sequences.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "641"," Win        "," No protocol sequences were registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "642"," Win        "," The server is not listening.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "643"," Win        "," There is nothing to unexport.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "644"," Win        "," Thread is not cancelled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "645"," Win        "," The error specified is not a valid Windows RPC error code.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "646"," Win        "," The object UUID was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "647"," Win        "," Not enough resources are available to complete this operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "648"," Win        "," The procedure number is out of range.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "649"," Win        "," An RPC protocol error occurred.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "650"," Win        "," The RPC protocol sequence was not found.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "651"," Win        "," The RPC protocol sequence is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "652"," Win        "," A security package specific error occurred.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "653"," Win        "," Some data remains to be sent in the request buffer.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "654"," Win        "," The server has insufficient memory to complete this operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "655"," Win        "," The server is too busy to complete this operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "656"," Win        "," The server is unavailable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "657"," Win        "," The string is too long.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "})
aAdd(aDescErro,{  "658"," Win        "," The type UUID is already registered.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "659"," Win        "," The authentication level is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "660"," Win        "," The authentication service is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "661"," Win        "," The authentication type is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "662"," Win        "," The authorization service is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "663"," Win        "," The interface is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "664"," Win        "," The manager type is unknown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "665"," Win        "," The requested authentication level is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "666"," Win        "," The name syntax is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "})
aAdd(aDescErro,{  "667"," Win        "," The transfer syntax is not supported by the server.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "668"," Win        "," The type UUID is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "669"," Win        "," A UUID that is valid only on this computer has been allocated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "})
aAdd(aDescErro,{  "670"," Win        "," No network address is available to use to construct a UUID.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "671"," Win        "," The binding handle is the incorrect type.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "672"," Win        "," The server attempted an integer divide by zero.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          "})
aAdd(aDescErro,{  "673"," Win        "," The stub received bad data.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              "})
aAdd(aDescErro,{  "674"," Win        "," The byte count is too small.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "675"," Win        "," The enumeration value is out of range.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "676"," Win        "," Invalid operation on the encoding/decoding handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "})
aAdd(aDescErro,{  "677"," Win        "," The idl pipe object is invalid or corrupted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "678"," Win        "," The operation is invalid for a given idl pipe object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "679"," Win        "," The list of servers available for auto_handle binding was exhausted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "})
aAdd(aDescErro,{  "680"," Win        "," A null reference pointer was passed to the stub.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "681"," Win        "," The stub is unable to get the call handle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "})
aAdd(aDescErro,{  "682"," Win        "," The file designated by DCERPCCHARTRANS cannot be opened.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "})
aAdd(aDescErro,{  "683"," Win        "," The file containing the character translation table has fewer than 512 bytes.                                                                                                                                                                                                                                                                                                                                                                                                                                                            "})
aAdd(aDescErro,{  "684"," Win        "," The context handle changed during a call.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "})
aAdd(aDescErro,{  "685"," Win        "," The context handle does not match any known context handles.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "})
aAdd(aDescErro,{  "686"," Win        "," The binding handles passed to a remote procedure call do not match.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      "})
aAdd(aDescErro,{  "687"," Win        "," A null context handle is passed as an [in] parameter.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})
aAdd(aDescErro,{  "688"," Win        "," Incompatible version of the serializing package.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "})
aAdd(aDescErro,{  "689"," Win        "," The idl pipe version is not supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "})
aAdd(aDescErro,{  "690"," Win        "," Incompatible version of the RPC stub.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    "})

If (nPos := aScan(aDescErro,{|x|AllTrim(x[1]) == cNumErro})) > 0
	cDescErro := AllTrim(aDescErro[nPos][1]) + ' - S.O.: ' + AllTrim(aDescErro[nPos][2]) + ' - Descr.: ' + AllTrim(aDescErro[nPos][3])
Else
	cDescErro := 'Erro n˙mero ' + cNumErro + ' - descriÁ„o n„o encontrada.'
EndIf

Return cDescErro   
      
************************************************************************************************************************************

Static Function MakePath(cPath)

Local cDir 	:= Left(cPath,At('\',cPath) - 1)
Local aPath 
Local nI 	:= 1

cPath 	:= AllTrim(cPath)

If Right(cPath,1) == '\'
	cPath := Left(cPath,len(cPath) - 1)
EndIf

aPath	:= Separa(cPath,'\',.F.)

//Crio a pasta em que serao gravados os arquivos caso ela nao exista
If !File(cPath)

	For nI := 1 to len(aPath)
		If nI == 1 .and. Substr(aPath[nI],2,1) == ':'//Raiz 
			loop		
		EndIf
		
		cDir += '\' + aPath[nI]
		MakeDir(cDir)
	Next	

EndIf

Return

************************************************************************************************************************************

#ENDIF
