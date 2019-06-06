#EL PROGRAMA PRESENTA INICIALMENTE UN MENU PRINCIPAL DE 2 OPCIONES DE UN JUEGO LOGICO DE ROMPECABEZAS:
    #OPCION 1: LEER INSTRUCCIONES DEL JUEGO
    #OPCION 2: JUGAR MODO FACIL

#CUANDO SE ELIGE LA OPCION 2, SE IMPRIME UNA CUADRICULA Y SE PIDE AL USUARIO INGRESAR LAS CASILLAS QUE TIENEN LETRAS.
#SI EL USUARIO NO RESUELVE CORRECTAMENTE, APARECERA UN NUEVO MENU (MENU SECUNDARIO) CON 3 OPCIONES:
    #OPCION 1: JUGAR DE NUEVO
    #OPCION 2: VER RESULTADO
    #OPCION 3: SALIR DEL PROGRAMA

#AL SELECCIONAR LA OPCION 2, MUESTRA AL USUARIO LA RESPUESTA CORRECTA Y PIDE AL USUARIO TECLEAR EL NUMERO "1" PARA REGRESAR
#AL MENU PRINCIPAL. AQUI ES CUANDO SE PRESENTA LA FALLA. AL PRESIONAR LA TECLA 1, REGRESA AL MENU PRINCIPAL(funcion sub menu)
#PERO AL MOMENTO DE QUERER VOLVER A ELEGIR LA OPCION 2(JUGAR MODO FACIL), EL PROGRAMA NO AVANZA Y DEJA DE FUNCIONAR. SIN EMBARGO, SI SE ELIJE LA
# OPCION 1(INSTRUCCIONES), SI ES POSIBLE ACCEDER A ELLAS.


# ES MUY POSIBLE QUE EL PROGRAMA PRESENTE LA FALLA DENTRO DE LA SUBRUTINA JUGAR_DENUEVO_FACIL DE LA FUNCION DE MATRIZ_FACIL.
#SE UTILIZA UNA SENTENCIA GOTO (LINEAS 216, 246, 264) PARA ROMPER LA SUBRUTINA Y REGRESAR AL MENU PRINCIPAL. SIN EMBARGO, NO ES
#POSIBLE VOLVER A JUGAR DESDE EL MENU PRINCIPAL
#UNA SEGUNDA VEZ(ES CUANDO EL PROGRAMA DEJA DE FUNCIONAR).

#MENU PRINCIPAL
sub menu{
system ("cls");
print("KAKURO\n");
print("MENU: \n");
print("1) Instrucciones del juego \n");
print("2) Jugar modo facil \n");
do{
print("Escriba la opcion que desea: \n");
$opcions=<STDIN>;
if(0>=$opcions || 3<$opcions){
  print("OPCION INVALIDA. INTENTE DE NUEVO.\n");  #VALIDACION DE ENTRADA DE DATOS
}
}while(0>=$opcions || 3<$opcions);
if($opcions==1){
  system ("cls");
    goto & instrucciones;
  }
  else{
    if ($opcions==2){
      goto & matriz_facil;
    }
  }
}

sub instrucciones{
  print ("Hay que rellenar las casillas correspondiente con numeros del 1 al 9, teniendo en cuenta que:\n
  1. Cada fila o columna debe sumar lo indicado en la casilla.\n
     Cuando una casilla indica dos valores, separados por '/',\n
     el valor de la izquiera representa la suma de la fila, y el valor de la derecha la suma de la columna.\n
  2. No se puede repetir un mismo numero ya sea por fila o columna.\n");
  do{
  print("PRESIONE LA TECLA 1 PARA REGRESAR AL MENU PRINCIPAL\n");
  $option = <STDIN>;
  if($option!=1){
    print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
  }
}while($option!=1);
goto & menu;
}


sub matriz_facil{
  #CREACION DE LA MATRIZ 3X3 CON NUMEROS ALEATORIOS SIN REPETIR
for($i=1;$i<=3;$i++){
  for($j=1;$j<=3;$j++){
    do{
      $matriz[$i][$j] = 1+int(rand(9));
    }while $udes[$matriz[$i][$j]]++;
  }
}


$a = $matriz[2][2];
$c = $matriz[3][2];
$d = $matriz[3][3];
$b = $matriz[2][3];
$f1c2 = $a + $c;
$f1c3 = $b + $d;
$f2c1 = $a + $b;
$f3c1 = $c + $d;

$matriz[1][2] = $f1c2;
$matriz[1][3] = $f1c3;
$matriz[2][1] = $f2c1;
$matriz[3][1] = $f3c1;

$m = $matriz[1][2];
$n = $matriz[1][3];
$o = $matriz[2][1];
$p = $matriz[3][1];

delete $matriz [1][1];




sub imprimir_facil{ #IMPRIME LA MATRIZ VISIBLE AL USUARIO
  for($i=1;$i<=3;$i++){
    for($j=1;$j<=3;$j++){
         if($i==1 && $j==1){
           print("|     |");
         }
         else{
           if($i==2 && $j==2){
             print("|   A  |");
           }
           else{
             if($i==2 && $j==3){
               print("|   B  |");
             }
             else{
               if($i==3 && $j==2){
                 print("|   C  |");
               }
               else{
                 if($i==3 && $j==3){
                   print("|   D  |")
                 }
                 else{
                   print "| $matriz[$i][$j] |";
                 }
               }
             }
           }
         }
        }
        print(" \n")
    }
  }


sub casillas_facil{ #PREGUNTA AL USUARIO LOS VALORES DE LAS CASILLAS
do{
  print("Escriba el valor de la casilla A: \n");
  $casilla1=<STDIN>;
  if(0>=$casilla1 || 9<$casilla1){
    print("SELECCIONE UNICAMENTE NUMEROS DEL 1 AL 9. INTENTE DE NUEVO.\n");
  }
}while(0>=$casilla1 || 9<$casilla1);


do{
  print("Escriba el valor de la casilla B: \n");
  $casilla2=<STDIN>;
  if(0>=$casilla2 || 9<$casilla2){
    print("SELECCIONE UNICAMENTE NUMEROS DEL 1 AL 9. INTENTE DE NUEVO.\n");
  }
}while(0>=$casilla2 || 9<$casilla2);

do{
  print("Escriba el valor de la casilla C: \n");
  $casilla3=<STDIN>;
  if(0>=$casilla3 || 9<$casilla3){
    print("SELECCIONE UNICAMENTE NUMEROS DEL 1 AL 9. INTENTE DE NUEVO.\n");
  }
}while(0>=$casilla3 || 9<$casilla3);

do{
  print("Escriba el valor de la casilla D: \n");
  $casilla4=<STDIN>;
  if(0>=$casilla4 || 9<$casilla4){
    print("SELECCIONE UNICAMENTE NUMEROS DEL 1 AL 9. INTENTE DE NUEVO.\n");
  }
}while(0>=$casilla4 || 9<$casilla4);

$w = $casilla1+$casilla2;
$x = $casilla3+$casilla4;
$y = $casilla1+$casilla3;
$z = $casilla2+$casilla4;
}



sub jugar_denuevo_facil{ #PERMITE JUGAR Y REPETIR EL JUEGO EN CASO DE EQUIVOCARSE
#do{
$c1=0;
$c2=0;
$c3=0;
$c4=0;
system ("cls");
  & imprimir_facil;
  & casillas_facil;
  if($casilla1==$casilla2 || $casilla1==$casilla3|| $casilla2==$casilla4 || $casilla3==$casilla4){
    print("AH CARAY, USTED NO PUEDE REPETIR EL MISMO NUMERO EN LA MISMA FILA O COLUMNA. \n");
    do{
      print("OPCIONES \n");
      print("1) Jugar de nuevo\n");
      print("2) Ver respuesta\n");
      print("3) Salir del juego\n");
      print("Seleccione la opcion que desee hacer: \n");
      $option = <STDIN>;
      if(0>=$option || 3<$option){
        print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
      }
    }while(0>=$option || 3<$option);

  }
  else{
    if($m!=$y || $n!=$z || $o!=$w || $p!=$x){
      if($m!=$y){
        $c1=$c1+1;
      }
        if($n!=$z){
          $c2=$c2+1;
        }
          if( $o!=$w){
            $c3=$c3+1;
          }
            if($p!=$x){
              $c4=$c4+1;
            }
      $errores=$c1+$c2+$c3+$c4;
      if($errores==1){
        print("AH CARAY, USTED TIENE $errores ERROR EN SU MATEMATICA. \n");
      }
      else{
        print("AH CARAY, USTED TIENE $errores ERRORES EN SU MATEMATICA. \n");
      }
      do{
        print("OPCIONES \n");
        print("1) Jugar de nuevo\n");
        print("2) Ver respuesta\n");
        print("3) Salir del juego\n");
        print("Seleccione la opcion que desee hacer: \n");
        $option = <STDIN>;
        if(0>=$option || 3<$option){
          print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
        }
      }while(0>=$option || 3<$option);
    }
    else{
    print("USTED ES UN VERDADERO CAMPEON. HA PODIDO RESOLVER EL ENIGMA\n");
    do{
    print("PRESIONE LA TECLA 1 PARA regresar al Menu Principal\n");
    $option = <STDIN>;
    if($option!=1){
      print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
    }
  }while($option!=1);
  goto & menu;                                              #REGRESA AL MENU PRINCIPAL PERO NO LEE LA NUEVA ENTRADA!!!!
    }
  }
}

system ("cls");
& jugar_denuevo_facil;
  if($option == 1){
  do{
    system ("cls");
     & jugar_denuevo_facil;
  } while($option==1);
  if($option == 2){
    system ("cls");
    for($i=1;$i<=3;$i++){
      for($j=1;$j<=3;$j++){
         print "| $matriz[$i][$j] |";
          }
          print(" \n")
          }
          print("ANIMO, A LA SIGUIENTE PODRA RESOLVERLO. NO DESISTA\n");
          do{
          print("PRESIONE LA TECLA 1 PARA REGRESAR AL MENU PRINCIPAL\n");
          $optionq = <STDIN>;
          if($optionq!=1){
            print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
          }
        }while($optionq!=1);
        goto & menu;                                               #REGRESA AL MENU PRINCIPAL PERO NO LEE LA NUEVA ENTRADA!!!!
        }
        else{
           exit;
        }
}
else{
    if($option == 2){
      system ("cls");
      for($i=1;$i<=3;$i++){
        for($j=1;$j<=3;$j++){
           print "| $matriz[$i][$j] |";
            }
            print(" \n")
            }
            print("ANIMO, A LA SIGUIENTE PODRA RESOLVERLO. NO DESISTA\n");
            do{
            print("PRESIONE LA TECLA 1 PARA REGRESAR AL MENU PRICIPAL\n");
            $optionq = <STDIN>;
            if($optionq!=1){
              print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
            }
          }while($optionq!=1);
          goto & menu;                                                       #REGRESA AL MENU PRINCIPAL PERO NO LEE LA NUEVA ENTRADA!!!!
          }
          else{
            if($option == 3){
               exit;
            }
          }
      }
}

& menu;
