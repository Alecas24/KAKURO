use warnings;
use 5.010;
no warnings 'experimental';
#EL PROGRAMA PRESENTA INICIALMENTE UN MENU PRINCIPAL DE 2 OPCIONES DE UN JUEGO LOGICO DE ROMPECABEZAS:
    #OPCION 1: LEER instructions DEL JUEGO
    #OPCION 2: JUGAR MODO FACIL

#CUANDO SE ELIGE LA OPCION 2, SE IMPRIME UNA CUADRICULA Y SE PIDE AL USUARIO INGRESAR LAS CASILLAS QUE TIENEN LETRAS.
#SI EL USUARIO NO RESUELVE CORRECTAMENTE, APARECERA UN NUEVO MENU (MENU SECUNDARIO) CON 3 OPCIONES:
    #OPCION 1: JUGAR DE NUEVO
    #OPCION 2: VER RESULTADO
    #OPCION 3: SALIR DEL PROGRAMA

#AL SELECCIONAR LA OPCION 2, MUESTRA AL USUARIO LA RESPUESTA CORRECTA Y PIDE AL USUARIO TECLEAR EL NUMERO "1" PARA REGRESAR
#AL MENU PRINCIPAL. AQUI ES CUANDO SE PRESENTA LA FALLA. AL PRESIONAR LA TECLA 1, REGRESA AL MENU PRINCIPAL(funcion sub menu)
#PERO AL MOMENTO DE QUERER VOLVER A ELEGIR LA OPCION 2(JUGAR MODO FACIL), EL PROGRAMA NO AVANZA Y DEJA DE FUNCIONAR. SIN EMBARGO, SI SE ELIJE LA
# OPCION 1(instructions), SI ES POSIBLE ACCEDER A ELLAS.


# ES MUY POSIBLE QUE EL PROGRAMA PRESENTE LA FALLA DENTRO DE LA SUBRUTINA easy_play_again DE LA FUNCION DE easy_play.
#SE UTILIZA UNA SENTENCIA GOTO (LINEAS 216, 246, 264) PARA ROMPER LA SUBRUTINA Y REGRESAR AL MENU PRINCIPAL. SIN EMBARGO, NO ES
#POSIBLE VOLVER A JUGAR DESDE EL MENU PRINCIPAL
#UNA SEGUNDA VEZ(ES CUANDO EL PROGRAMA DEJA DE FUNCIONAR).

#MENU PRINCIPAL
sub menu {
  $menu = 1;
  system ("clear");
  print("KAKURO\n");
  print("MENU: \n");
  print("1) instructions del juego \n");
  print("2) Jugar modo facil \n");
  do {
    print("Escriba la opcion que desea: \n");
    $key = <STDIN>;
    if ($key == 0 || $key > 2) {
      print("OPCION INVALIDA. INTENTE DE NUEVO.\n");  #VALIDACION DE ENTRADA DE DATOS
    }
    if ($key == 1) {
      system ("clear");
      $menu = 0;
      &instructions;
    } else {
      if ($key == 2) {
        $menu = 0;
        &easy_play;
      }
    }
  } while ($menu);
}

sub instructions {
  &read_and_print_file('instructions.txt');
  do {
    print("PRESIONE LA TECLA 1 PARA REGRESAR AL MENU PRINCIPAL\n");
    $key = <STDIN>;
    if ($key != 1) {
      print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
    }
  } while ($key != 1);
  &menu;
}


sub easy_play {
  #CREACION DE LA MATRIZ 3X3 CON NUMEROS ALEATORIOS SIN REPETIR
  for ($i = 1; $i <= 3; $i++) {
    for ($j = 1; $j<=3; $j++) {
      $array[$i][$j] = 1 + int(rand(9));
    }
  }
  $a = $array[2][2];
  $c = $array[3][2];
  $d = $array[3][3];
  $b = $array[2][3];
  $f1c2 = $a + $c;
  $f1c3 = $b + $d;
  $f2c1 = $a + $b;
  $f3c1 = $c + $d;
  $array[1][2] = $f1c2;
  $array[1][3] = $f1c3;
  $array[2][1] = $f2c1;
  $array[3][1] = $f3c1;
  $m = $array[1][2];
  $n = $array[1][3];
  $o = $array[2][1];
  $p = $array[3][1];
  delete $array [1][1];
  #IMPRIME LA MATRIZ VISIBLE AL USUARIO
  sub print_array {
    for ($i = 1; $i <= 3; $i++) {
      for ($j = 1; $j <= 3; $j++) {
        if ( $i == 1 && $j == 1) {
          print("|     |");
        } else {
          if ($i == 2 && $j == 2) {
            print("|   A  |");
          } else {
            if ($i == 2 && $j == 3) {
              print("|   B  |");
            } else {
              if ($i == 3 && $j == 2) {
                print("|   C  |");
              } else {
                if ($i == 3 && $j == 3) {
                  print("|   D  |")
                }
                else {
                  print "| $array[$i][$j] |";
                }
              }
            }
          }
        }
      }
      print(" \n")
    }
    &require_answers
  }
  #PREGUNTA AL USUARIO LOS VALORES DE LAS CASILLAS
  sub require_answers {
    $answers;
    $answerIndex = 0;
    do {
      given ($answerIndex) {
        when ($answerIndex == 0) {
          say "Escriba el valor de la casilla A: \n";
        }
        when ($answerIndex == 1) {
          say "Escriba el valor de la casilla B: \n";
        }
        when ($answerIndex == 2) {
          say "Escriba el valor de la casilla C: \n";
        }
        when ($answerIndex == 3) {
          say "Escriba el valor de la casilla D: \n";
        }
      }
      $key = <STDIN>;
      if ($key >= 0 && $key < 10 ) {
        $answers[$answerIndex] = $key;
        $answerIndex++;
      } else {
        say "SELECCIONE UNICAMENTE NUMEROS DEL 1 AL 9. INTENTE DE NUEVO.\n";
      }
    } while ($answerIndex < 4);
    $w = $answers[0] + $answers[1];
    $x = $answers[2] + $answers[3];
    $y = $answers[0] + $answers[2];
    $z = $answers[1] + $answers[3];
    &verify_answers
  }

  sub verify_answers {
    if ($m != $y || $n != $z || $o != $w || $p != $x) {
      if ($m != $y) {
        $c1 = $c1 + 1;
      }
      if ($n != $z) {
        $c2 = $c2 + 1;
      }
      if ($o != $w) {
        $c3 = $c3 + 1;
      }
      if ($p != $x) {
        $c4 = $c4 + 1;
      }
      $errores = $c1 + $c2 + $c3 + $c4;
      if ($errores) {
        print("AH CARAY, USTED TIENE $errores ERRORES EN SU MATEMATICA. \n");
        $c1 = 0; $c2 = 0; $c3 = 0; $c4 = 0;
        if ($answers[0] == $answers[1] || $answers[0] == $answers[2] || $answers[1] == $answers[3] || $answers[2] == $answers[3]) {
          print("USTED NO PUEDE REPETIR EL MISMO NUMERO EN LA MISMA FILA O COLUMNA. \n");
        }
        &dead_options
      } else {
        &dead_options
      }
    } else {
      print("USTED ES UN VERDADERO CAMPEON. HA PODIDO RESOLVER EL ENIGMA\n");
      do {
        print("PRESIONE LA TECLA 1 PARA regresar al Menu Principal\n");
        $keyEnd = <STDIN>;
        if ($keyEnd != 1) {
          print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
        }
      } while ($keyEnd != 1);
      #REGRESA AL MENU PRINCIPAL PERO NO LEE LA NUEVA ENTRADA!!!!
      &menu;
    }
  }
  #PERMITE JUGAR Y REPETIR EL JUEGO EN CASO DE EQUIVOCARSE
  sub easy_play_again {
    #do{
    $c1 = 0;
    $c2 = 0;
    $c3 = 0;
    $c4 = 0;
    system ("clear");
    & print_array;
    & require_answers;
  }

  sub dead_options {
    do {
      &read_and_print_file('options.txt');    
      $keyDead = <STDIN>;
      if ($keyDead == 0 || $keyDead > 3) {
        print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
      } else {
        given ($keyDead) {
          when ($keyDead == 1) {
            &easy_play_again;
          }
          when ($keyDead == 2) {
            # Non asigned code
            print("N SE HA ASIGNADO UNA FUNCIÓN A ESTE CÓDIGO");
            &show_correct_answers;
          }
          when ($keyDead == 3) {
            &menu;
          }
        }
      }
    } while ($keyDead == 0 || $keyDead > 3);
  }

  sub show_correct_answers {
    system ("clear");
    for ($i = 1; $i <= 3; $i++) {
      for ($j = 1; $j <= 3; $j++) {
        print "| $array[$i][$j] |";
      }
      print(" \n")
    }
    print("ANIMO, A LA SIGUIENTE PODRA RESOLVERLO. NO DESISTA\n");
    do {
      print("PRESIONE LA TECLA 1 PARA REGRESAR AL MENU PRINCIPAL\n");
      $optionq = <STDIN>;
      if ($optionq != 1) {
        print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
      } else {
        &menu;          
      }
    } while ($optionq != 1);
  }

  sub read_and_print_file {
    open(my $fh, '<:encoding(UTF-8)', @_)
    or die "No se ha podido leer el archivo '@_' $!";
    while (my $row = <$fh>) {
      chomp $row;
      print "$row\n";
    }
  }
  system ("clear");
  &easy_play_again;
}

& menu;
