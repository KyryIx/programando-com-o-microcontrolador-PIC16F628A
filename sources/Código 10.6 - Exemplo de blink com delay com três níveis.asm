  ; DESENVOLVIDO POR EVERTON P. CRUZ
  ; COM O PROPOSITO DE USO BASE PARA OS EPISODIOS
  ; DA SERIE CONHECENDO O MICROCONTROLADOR PIC16F628A
  #INCLUDE <P16F628A.INC>
  LIST P=16F628A
  __CONFIG _BOREN_ON & _CP_OFF & _PWRTE_ON & _WDT_OFF & _LVP_OFF & _MCLRE_OFF & _INTRC_OSC_NOCLKOUT
 
  ; DEFINICAO DE VARIAVEIS
  #DEFINE N1  0x20   ; VARIAVEL DE TEMPO N1
  #DEFINE N2  0x21   ; VARIAVEL DE TEMPO N2
  #DEFINE N3  0x22   ; VARIAVEL DE TEMPO N3

  #DEFINE LED PORTA, RA0 ; PINO DO LED  

  ORG     0x00       ; TRATAMENTO DO RESET
  GOTO    SETUP_PROCESSO

  ORG     0x04       ; TRATAMENTO DAS INTERRUPCOES
  RETFIE
    
SETUP_PROCESSO:
  ; SELECIONA O BANCO 1 DE MEMORIA
  BCF     STATUS, RP1
  BSF     STATUS, RP0

  BSF     PCON, OSCF ; CONF. FREQÜÊNCIA DO OSCILADOR INTERNO EM 4 MHz

  ; CONFIGURACOES DO REGISTRADOR OPTION
  MOVLW   B'10000000'
  MOVWF   OPTION_REG
    
  ; MODIFICA O COMPORTAMENTO DO PORTA
  MOVLW   B'11111110'
  MOVWF   TRISA
    
  ; MODIFICA O COMPORTAMENTO DO PORTB
  MOVLW   B'11111111'
  MOVWF   TRISB
    
  ; SELECIONA O BANCO 0 DE MEMORIA
  BCF     STATUS, RP1
  BCF     STATUS, RP0
    
  ; DEFINE O MODO DE OPERACAO DO COMP. ANALOG. DESLIGADOS
  MOVLW   B'00000111'
  MOVWF   CMCON

  ; CONFIGURACOES DE INTERRUPCOES
  MOVLW   B'00000000'
  MOVWF   INTCON

PRINCIPAL:
  ; DELAY DE 1 SEGUNDO
  MOVLW   .17   ; VALOR PARA N1
  MOVWF   N1
  MOVLW   .9    ; VALOR PARA N2
  MOVWF   N2
  MOVLW   .131  ; VALOR PARA N3
  MOVWF   N3
loop1:
  DECFSZ  N1
  GOTO    loop1
  DECFSZ  N2
  GOTO    loop1
  DECFSZ  N3
  GOTO    loop1

  NOP           ; INCREMENTA 1 CICLO
  ; LIGA LED
  BSF     LED

  ; DELAY DE 0.5 SEGUNDO
  MOVLW   .113 ; VALOR PARA N1
  MOVWF   N1
  MOVLW   .2   ; VALOR PARA N2
  MOVWF   N2
  MOVLW   .218 ; VALOR PARA N3
  MOVWF   N3
loop2:
  DECFSZ  N1
  GOTO    loop2
  DECFSZ  N2
  GOTO    loop2
  DECFSZ  N3
  GOTO    loop2
  
  NOP          ; INCREMENTA 1 CICLO
  ; LIGA LED
  BCF     LED
  
  GOTO    PRINCIPAL
  
  END