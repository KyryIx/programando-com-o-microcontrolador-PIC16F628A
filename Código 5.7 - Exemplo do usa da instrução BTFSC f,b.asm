; INSTRUCAO: BTFSC
; TESTA SE O BIT b DO REGISTRADOR f ESTA limpo (valor 0)
; SE ESTIVER limpo (valor 0) SALTA A PROXIMA INSTRUCAO
MOVLW   .197      ; 197 DECIMAL = 1100.0101 BINARIO
MOVWF   0x0C      ; 
                  ; 
BTFSC   0x0C, 5   ; BIT NA POSICAO 5 EH ZERO >---+
                  ;                              |
NOP               ;                              |
                  ;                              |
NOP               ; <----------------------------+
