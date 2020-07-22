
foo.o:     file format elf32-i386


Disassembly of section .text:

00000000 <foo>:
   0:	55                   	push   ebp      # Guarda o atual comeco da stack
   1:	89 e5                	mov    ebp,esp  # E seta o topo da stack como o novo comeco
   3:	83 c4 08             	add    esp,0x8  # Volta 8 bytes na stack até os parametros da funcao
   6:	58                   	pop    eax      # Pega o primeiro parametro
   7:	5b                   	pop    ebx      # Pega o segundo parametro
   8:	01 d8                	add    eax,ebx  # Soma os parametros e guarda em eax
   a:	89 ec                	mov    esp,ebp  # Retorna o topo da stack p/ posicao original
   c:	5d                   	pop    ebp      # Retira o antigo comeco da stack voltando tudo ao estado inicial
   d:	c3                   	ret             # Sai dessa chamada de funcao
