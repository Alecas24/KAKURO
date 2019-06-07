use warnings;
use 5.010;
no warnings 'experimental';

sub menu {
  $menu = 1;
  system ("cls");
  print("KAKURO\n");
  print("MENU: \n");
  print("1) instructions del juego \n");
  print("2) Jugar modo facil \n");
  print("3) Jugar modo intermedio \n");
  do {
    print("Escriba la opcion que desea: \n");
    $key = <STDIN>;
    if ($key < 0 || $key > 3 ) {
      print("OPCION INVALIDA. INTENTE DE NUEVO.\n");  #VALIDACION DE ENTRADA DE DATOS
    }
    if ($key == 1) {
      system ("cls");
      $menu = 0;
      &instructions;
    } else {
      if ($key == 2) {
        $menu = 0;
        &easy_play;
      }
      else{
        if($key==3){
          $menu=0;
          &intermediate_play;
        }
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
    system ("cls");
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
    system ("cls");
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
  system ("cls");
  &easy_play_again;
}

#& menu;



sub intermediate_play{
  for($i=2;$i<=4;$i++){
    for($j=2;$j<=4;$j++){
      do{
        $array2[$i][$j] = 1+int(rand(9));
      }while $udes[$array2[$i][$j]]++;
    }
  }


$a = $array2[2][2];
$c = $array2[3][2];
$d = $array2[3][3];
$b = $array2[2][3];
$e = $array2[2][4];
$f = $array2[3][4];
$g = $array2[4][4];
$h = $array2[4][3];
$i = $array2[4][2];

$f1c2 = $a + $c + $i;
$f1c3 = $b + $d + $h;
$f1c4 = $e + $f + $g;
$f2c1 = $a + $b + $e;
$f3c1 = $c + $d + $f;
$f4c1 = $i + $h + $g;

$array2[1][2] = $f1c2;
$array2[1][3] = $f1c3;
$array2[1][4] = $f1c4;
$array2[2][1] = $f2c1;
$array2[3][1] = $f3c1;
$array2[4][1] = $f4c1;

$m = $array2[1][2];
$n = $array2[1][3];
$q = $array2[1][4];
$o = $array2[2][1];
$p = $array2[3][1];
$r = $array2[4][1];

delete $array2 [1][1];




#Imprimir matriz
sub print_array2{
  for($i=1;$i<=4;$i++){
    for($j=1;$j<=4;$j++){
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
               if($i==2 && $j==4){
                 print("|   C  |");
               }
               else{
                 if($i==3 && $j==2){
                   print("|   D  |");
                 }
                 else{
                   if($i==3 && $j==3){
                     print("|   E  |");
                   }
                   else{
                     if($i==3 && $j==4){
                       print("|   F  |");
                     }
                     else{
                       if($i==4 && $j==2){
                         print("|   G  |");
                       }
                       else{
                         if($i==4 && $j==3){
                           print("|   H  |");
                         }
                         else{
                           if($i==4 && $j==4){
                             print("|   I  |");
                           }
                           else{
                             print ("| $array2[$i][$j] |");
                           }
                         }
                       }
                     }
                   }
                 }
               }
             }
           }
         }
        }
        print(" \n");
    }
  }

sub require_answers2{
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
      when ($answerIndex == 4) {
        say "Escriba el valor de la casilla C: \n";
      }
      when ($answerIndex == 2) {
        say "Escriba el valor de la casilla D: \n";
      }
      when ($answerIndex == 3) {
        say "Escriba el valor de la casilla E: \n";
      }
      when ($answerIndex == 5) {
        say "Escriba el valor de la casilla F: \n";
      }
      when ($answerIndex == 6) {
        say "Escriba el valor de la casilla G: \n";
      }
      when ($answerIndex == 7) {
        say "Escriba el valor de la casilla H: \n";
      }
      when ($answerIndex == 8) {
        say "Escriba el valor de la casilla I: \n";
      }
    }
    $key = <STDIN>;
    if ($key >= 0 && $key < 10 ) {
      $answers[$answerIndex] = $key;
      $answerIndex++;
    } else {
      say "SELECCIONE UNICAMENTE NUMEROS DEL 1 AL 9. INTENTE DE NUEVO.\n";
    }
  } while ($answerIndex < 9);


$w = $answers[0]+$answers[1]+$answers[4];
$x = $answers[3]+$answers[4]+$answers[5];
$v = $answers[6]+$answers[7]+$answers[8];
$y = $answers[0]+$answers[2]+$answers[6];
$z = $answers[1]+$answers[3]+$answers[7];
$u = $answers[4]+$answers[5]+$answers[8];
&verify_answers2
}

sub verify_answers2{
if($m!=$y || $n!=$z || $o!=$w || $p!=$x || $u!=$q || $v!=$r){
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
        if($u!=$q){
          $c5=$c5+1;
        }
        if($v!=$r){
          $c6=$c6+1;
        }
  $errores=$c1+$c2+$c3+$c4+$c5+$c6;
  if($errores){
    print("AH CARAY, USTED TIENE $errores ERRORES EN SU MATEMATICA. \n");
    $c1 = 0; $c2 = 0; $c3 = 0; $c4 = 0; $c5=0; $c6=0;
    if ($answers[1]==$answers[2] || $answers[1]==$answers[4]|| $answers[4]==$answers[0] || $answers[2]==$answers[3]
      || $answers[3]==$answers[5] || $answers[2]==$answers[5]|| $answers[6]==$answers[7] || $answers[7]==$answers[8]
      || $answers[6]==$answers[8] || $answers[0]==$answers[2]|| $answers[2]==$answers[6] || $answers[0]==$answers[6]
      || $answers[1]==$answers[3] || $answers[3]==$answers[7] || $answers[1]==$answers[7] || $answers[4]==$answers[5]
      || $answers[5]==$answers[8] || $answers[4]==$answers[8]) {
      print("USTED NO PUEDE REPETIR EL MISMO NUMERO EN LA MISMA FILA O COLUMNA. \n");
    }
    &dead_options2;
  }
  else{
    &dead_options2;
  }
}
else {
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



sub intermediate_play_again{
  $c1=0;
  $c2=0;
  $c3=0;
  $c4=0;
  $c5=0;
  $c6=0;
  system ("cls");
  & print_array2;
  & require_answers2;
}


sub dead_options2 {
  do {
    &read_and_print_file2('options.txt');
    $keyDead = <STDIN>;
    if ($keyDead == 0 || $keyDead > 3) {
      print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
    } else {
      given ($keyDead) {
        when ($keyDead == 1) {
          &intermediate_play_again;
        }
        when ($keyDead == 2) {
          # Non asigned code
          &show_correct_answers2;
        }
        when ($keyDead == 3) {
          &menu;
        }
      }
    }
  } while ($keyDead == 0 || $keyDead > 3);
}


sub show_correct_answers2{
    for($i=1;$i<=4;$i++){
      for($j=1;$j<=4;$j++){
         print "| $array2[$i][$j] |";
          }
          print(" \n")
          }
          print("ANIMO, A LA SIGUIENTE PODRA RESOLVERLO. NO DESISTA\n");
          do{
          print("PRESIONE LA TECLA 1 PARA REGRESAR AL MENU\n");
          $optionr = <STDIN>;
          if($optionr!=1){
            print("OPCION INVALIDA. INTENTE DE NUEVO.\n");
          }
          else{
            &menu;
          }
        }while($optionr!=1);
      }

      sub read_and_print_file2 {
        open(my $fh, '<:encoding(UTF-8)', @_)
        or die "No se ha podido leer el archivo '@_' $!";
        while (my $row = <$fh>) {
          chomp $row;
          print "$row\n";
        }
      }
      system ("cls");
      &intermediate_play_again;
      }
&menu;
