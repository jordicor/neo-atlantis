
//---------------------------------------------------------------------------
// PROGRAMA Neo_Atlantis
// Programador: Jos‚ Ignacio Alvarez Ruiz&Jordi Corrales Jim‚nez
//                                     Nanhy
// Fecha inicio:1/5/99
// Fecha fin: ??-??-??
// Grupo de programacion: NanhySoft Team (AVALON INTERACTIVE)
//---------------------------------------------------------------------------

//COMPILER_OPTIONS _ignore_errors;

PROGRAM Neo_Atlantis;

CONST

GLOBAL

suena;
munyeco;
m_esther;
libro_leido;
llamado=0;
topa;
mapa;
durezas;
tama¤o;
fichero;
equis;
igriega;
sitio;
escribe;
m_juan_llama;
espera;
a;
b;
presenta;
logo;
cuenta;

textos[]=
  "Juan,¨puedes venir al sal¢n?",

  "Mi mujer me ha llamado",
  "ire a ver lo que quiere",

  "Tengo ganas de leer un poco",

  "Buenos d¡as,¨has dormido bien?",

  "Si...bueno...pero he tenido un",
  "sue¤o muy extra¤o",

  "¨Qu‚ sue¤o?",

  "Un sue¤o en el que por la",      //9
  "desglaciaci¢n de los hielos",
  "y la subida de los mares",
  "hab¡a grandes inundaciones,",
  "se producian cat strofes,",
  "incendios, terremotos y",
  "tsunamis, la gente enloquec¡a",
  "y luchaba por sobrevivir",      //17-1

  "Eso debe significar que",
  "ya ha llegado el momento";


BEGIN
    set_mode(m640x480);
    //load_pal("\3dsmax2.5\images\logo.pal");
    //logo=load_map("\3dsmax2.5\images\logo.map");
    //put(0,logo,320,240);
    //fade(100,100,100,1);

    //WHILE (scan_code==0)
    // FRAME;
    //END
    //fade(0,0,0,1);
    //FRAME;
    //WHILE (cuenta<70)
    // FRAME;
    // cuenta++;
    //END

    load_fnt("neo\neoa.fnt");
    //load_song("c:\cancio~1\jordi\winner2.s3m",1);
    //set_mode(m320x240);
    fade_on();
    //set_fps(30,0);
    //FRAME;
    //start_fli("c:\div2\flc\introd1.flc",0,0);

    //  WHILE (frame_fli()<>0)
    //   FRAME;
    //   IF(key(_space)) BREAK; END
    // END

    //end_fli();
    //write(1,160,190,4,"Pulsa una tecla para continuar");

    //WHILE (scan_code==0)
    //  FRAME;
    //END

    delete_text(all_text);
    set_mode(m640x480);
    set_fps(30,1);
    load_fpg("\neo\juan.fpg"); //0
    load_fpg("\neo\p_juan.fpg"); //1
    load_pal("\neo\juan.fpg");
    mapa=1;
    durezas=2;
    tama¤o=100;
    equis=320;
    igriega=240;

  //song(0);
  mapea();

end

//---------------------------------------------------------------------------
// PROCESO DE JUAN
//---------------------------------------------------------------------------


PROCESS MU¥ECO(x,y,size)


PRIVATE
corre;
s_llama;
s_dialog;
s_suenyo;
s_llamado;
s_leer;
pulsa_ar;
pulsa_ab;
pulsa_d;
pulsa_i;
pulsa_a_i;
pulsa_a_d;
pulsa_ab_i;
pulsa_ab_d;
pulsa_diar;
pulsa_ar_c;
pulsa_ab_c;
pulsa_d_c;
pulsa_i_c;
pulsa_a_i_c;
pulsa_a_d_c;
pulsa_ab_i_c;
pulsa_ab_d_c;

BEGIN

    CTYPE=C_SCROLL;
    SCROLL.CAMERA=ID;
    GRAPH=1;
    Z=-5;

    file=0;

    LOOP
        a=x;b=y;

      // ANDA

        //Anda por las diagonales


        if(key(_control))
         corre=1;
        else
         corre=0;
        end

        if(key(_right)&key(_up))
          if (pulsa_a_d==0)
           flags=0; graph=145; pulsa_a_d=1;
          else
           if (corre==0) graph++; x+=3; y-=3; else graph+=3; x+=10; y-=7; end
           if(graph=>180) graph=145; end
          end
        else
          pulsa_a_d=0;
        end

        if(key(_left)&key(_up))
          if (pulsa_a_i==0)
            flags=1; graph=145; pulsa_a_i=1;
          else
           if (corre==0) graph++; x-=3; y-=3; else graph+=3; x-=10; y-=7; end
           if(graph=>180) graph=145; end
          end
        else
          pulsa_a_i=0;
        end

        if(key(_right)&key(_down))
          if (pulsa_ab_d==0)
            flags=0; graph=109; pulsa_ab_d=1;
          else
           if (corre==0) graph++; x+=3; y+=3; else graph+=3; x+=10; y+=7; end
           if(graph=>144) graph=109; end
          end
        else
          pulsa_ab_d=0;
        end

        if(key(_left)&key(_down))
          if (pulsa_ab_i==0)
            flags=1; graph=109; pulsa_ab_i=1;
          else
           if (corre==0) graph++; x-=3; y+=3; else graph+=3; x-=10; y+=7; end
           if(graph=>144) graph=109; end
          end
        else
          pulsa_ab_i=0;
        end

        //Direcciones comunes (arriba, abajo, izquierda y derecha)
        if(key(_up)&pulsa_a_i==0&pulsa_a_d==0&pulsa_ab==0)
           if (pulsa_ar==0)
            flags=0; graph=37; pulsa_ar=1;
           else
            if (corre==0) graph++; y-=3; else graph+=3; y-=7; end
            if (graph=>72) graph=37; end
           end
        else
          pulsa_ar=0;
        end

        if(key(_down)&pulsa_ab_i==0&pulsa_ab_d==0&pulsa_ar==0)
           if (pulsa_ab==0)
            flags=0; graph=1; pulsa_ab=1;
           else
            if (corre==0) graph++; y+=3; else graph+=3; y+=7; end
            if (graph=>36) graph=1; end
           end
        else
          pulsa_ab=0;
        end

        if(key(_right)&pulsa_a_d==0&pulsa_ab_d==0&pulsa_i==0)
           if (pulsa_d==0)
            flags=0; graph=73; pulsa_d=1;
           else
            if (corre==0) graph++; x+=3; else graph+=3; x+=10; end
            if (graph=>108) graph=73; end
           end
        else
          pulsa_d=0;
        end

        if(key(_left)&pulsa_a_i==0&pulsa_ab_i==0&pulsa_d==0)
           if (pulsa_i==0)
            flags=1; graph=73; pulsa_i=1;
           else
            if (corre==0) graph++; x-=3; else graph+=3; x-=10; end
            if (graph=>108) graph=73; end
           end
        else
          pulsa_i=0;
        end


//Comprueba si se topa con Esther
 IF(collision (TYPE esther))
  signal(m_esther,s_freeze);
  graph=1;
  IF(y<330)
   REPEAT
    y++; graph++; if(graph==36) graph=1; end
    FRAME;
   UNTIL (y==340)
  END
  IF(m_esther.x<munyeco.x)
   graph=73; flags=1;
   REPEAT
    x--; graph++; if(graph==108) graph=73; end
    FRAME;
   UNTIL (m_esther.x==munyeco.x)
  END
  IF(m_esther.x>munyeco.x)
   graph=73; flags=0;
   REPEAT
    x++; graph++; if(graph==108) graph=73; end
    FRAME;
   UNTIL (m_esther.x==munyeco.x)
  END
  signal(m_esther,s_wakeup);
  dialogos(2);
  REPEAT
   y++; graph++; if(graph==36) graph=1; end
   FRAME;
  UNTIL (y==375)
  graph=73; flags=0;
  REPEAT
   x++; graph++; if(graph==108) graph=73; end
   FRAME;
  UNTIL (x==255)
  signal(m_esther,s_wakeup);
 END


          topa=(map_get_pixel(1,durezas,id.x/2,(id.y+10)/2));

          IF (topa==000)
           x=a; y=b;
          END

          //IF (topa==254)
          // x=a; y=b;
          //END

          SWITCH (sitio)

           CASE 0:
            if (topa==255)
             GRAPH=1;
             sitio=1;
             mapa=3;
             durezas=4;
             tama¤o=80;
             equis=390; igriega=225;
             mapea();
             fade_on();
            end
           END

           CASE 1:
            IF (topa==254&key(_enter)&llamado==1)
              fade_off();
             libro();
             fade_on();
            END

            IF (topa==255)
             fade_off();
             sitio=2;
             mapa=5;
             graph=1;
             durezas=5+1;
             tama¤o=80;
             equis=615; igriega=420;
             dialogos(1);
             mapea2();
             fade_on();
             WHILE(fading)
              frame;
             END
            END
           END


           CASE 2:
            IF (topa==001)
             x=a; y=b;
             topa=15;
            END

            IF (topa==254)
             GRAPH=1;
             x=a; y=b;
             SWITCH (m_juan_llama)
              CASE 0:
               write(1,320,240,0,textos[1]);
               write(1,320,255,0,textos[2]);
               s_llamado=load_pcm("neo\juan4.pcm",0);
               FOR (suena=1; suena<10;suena++)
               sound(s_llamado,256,256);
               END
               WHILE (espera<100)
                frame;
                espera++;
               END
               unload_pcm(s_llamado);
              END
              CASE 1:
               IF (m_juan_llama==1&libro_leido==0)
                write(1,320,240,0,textos[3]);
               s_leer=load_pcm("neo\juan5.pcm",0);
               FOR (suena=1; suena<10;suena++)
               sound(s_leer,200,256);
               END
               WHILE (espera<100)
                frame;
                espera++;
               END
               unload_pcm(s_leer);
               END
              END
             END
             IF (m_juan_llama==1&libro_leido==1)
              sitio=3;
              unload_fpg(1);
              load_fpg("neo\quorbel.fpg");
              graph=37;
              mapa=1;
              durezas=2;
              tama¤o=50;
              equis=558; igriega=429;
              mapea();
             END
             WHILE (espera<100)
              frame;
              espera++;
             END
             delete_text(all_text);
             espera=0;
            END

            IF (topa==255 or key(_end))
             GRAPH=1;
             sitio=1;
             mapa=3;
             durezas=4;
             equis=190; igriega=447;
             mapea();
             fade_on();
            END

           END

           CASE 3:
            IF (topa==255)
              exit("Fin de beta de Neo Atlantis",0);
            END
           END

          END

        FRAME;
    END

END

//---------------------------------------------------------------------------
// PROCESO PARA PONER LOS MAPAS DE FONDO CON SUS DUREZAS
//---------------------------------------------------------------------------


PROCESS MAPEA()

 BEGIN

  fade_off();
  start_scroll(0,1,mapa,0,0,0);
  munyeco=mu¤eco(equis,igriega,tama¤o);
  fade_on();

 END


//---------------------------------------------------------------------------
// PROCESO PARA PONER LOS MAPAS DE FONDO CON SUS DUREZAS
//---------------------------------------------------------------------------


PROCESS MAPEA2()

 BEGIN

  fade_off();
  start_scroll(0,1,mapa,0,0,0);
  munyeco=mu¤eco(equis,igriega,tama¤o);
  m_esther=esther(56,318);
  fade_on();

 END

//---------------------------------------------------------------------------
// PROCESO PARA PONER LOS DIALOGOS
//---------------------------------------------------------------------------


PROCESS DIALOGOS(dialogo)

PRIVATE
v=20;
textoid;
textoid2;
textoid3;
textoid4;
s_llama;
s_dialog;
s_dialog2;
s_dialog3;
s_dialog4;
s_suenyo;
cwt;

BEGIN

 signal(munyeco,s_freeze);

 frame;

 espera=0;

 SWITCH (dialogo)
  CASE 1:
   IF (llamado==0)
    s_llama=load_pcm("neo\m_juan.pcm",0);
    textoid=write(1,370,240,4,textos[0]);
    WHILE (espera<70)
     IF (espera==0)
      FOR (cwt=1; cwt<10;cwt++)
       sound(s_llama,256,286);
      END
      FRAME;
      espera=1;
     END
     FRAME;
     espera++;
    END
    unload_pcm(s_llama);
    delete_text(textoid);
    espera=0;
    llamado=1;
   END
  END

  CASE 2:
  signal(m_esther,s_freeze);
  m_esther.graph=231;
  munyeco.graph=37;
  IF (m_juan_llama==0)
   s_dialog=load_pcm("neo\m_juan2.pcm",0);
   textoid=write(1,370,240,4,textos[4]);
   WHILE (espera<70)
    IF (espera==0)
     espera=1;
     FOR (cwt=1; cwt<10;cwt++)
      sound(s_dialog,256,286);
     END
     FRAME;
    END
     FRAME;
    espera++;
   END
   espera=0;
   delete_text(textoid);

   unload_pcm(s_dialog);
   s_suenyo=load_pcm("neo\juan1.pcm",0);
   textoid=write(1,370,240,4,textos[5]);
   textoid2=write(1,370,260,4,textos[6]);
   WHILE (espera<105)
    IF (espera==0)
     espera=1;
     FOR (cwt=1; cwt<10;cwt++)
      sound(s_suenyo,256,256);
     END
     FRAME;
    END
     FRAME;
    espera++;
   END
   espera=0;
   delete_text(textoid);
   delete_text(textoid2);

   unload_pcm(s_suenyo);
   s_dialog2=load_pcm("neo\m_juan3.pcm",0);
   textoid3=write(1,370,240,4,textos[7]);

   WHILE (espera<20)
    IF (espera==0)
     espera=1;
     FOR (cwt=1; cwt<10;cwt++)
      sound(s_dialog2,256,286);
     END
     FRAME;
    END
     FRAME;
    espera++;
   END
   espera=0;
   delete_text(textoid);

   unload_pcm(s_dialog2);
   s_dialog3=load_pcm("neo\juan2.pcm",0);
   FOR (cwt=8;cwt<16;cwt++)
    textoid4=write(1,370,200+v,4,textos[cwt]);
    v+=20;
   END

   WHILE (espera<599)
    IF (espera==0)
     espera=1;
     FRAME;
     FOR (cwt=1; cwt<10;cwt++)
      sound(s_dialog3,256,256);
     END
    END
     FRAME;
    espera++;
   END
   espera=0;

   delete_text(all_text);
   unload_pcm(s_dialog3);
  END


   s_dialog4=load_pcm("neo\m_juan4.pcm",0);
   textoid=write(1,370,240,4,textos[16]);
   textoid2=write(1,370,260,4,textos[17]);
   WHILE (espera<100)
    IF (espera==0)
     espera=1;
     FOR (cwt=1; cwt<10;cwt++)
      sound(s_dialog4,256,286);
     END
     FRAME;
    END
     FRAME;
    espera++;
   END
   espera=0;
   delete_text(textoid);
   delete_text(textoid2);

   unload_pcm(s_dialog4);

   m_juan_llama=1;
  END

 END

 munyeco.graph=1;
 m_esther.graph=1;
 signal(munyeco,s_wakeup);

END

//---------------------------------------------------------------------------
// PROCESO PARA EL LIBRO
//---------------------------------------------------------------------------


PROCESS LIBRO()

PRIVATE
pasa_pg=1;
s_orpresa;
nar;

BEGIN

 unload_fpg(1);
 libro_leido=0;
 load_fpg("neo\libro.fpg");
 s_orpresa=load_pcm("neo\juan3.pcm",0);
 start_scroll(0,1,pasa_pg,0,0,0);
 fade_on();
 LOOP
  LOOP
   IF (key(_enter)) break; END
    FRAME;
   END
   pasa_pg++;
   fade_off();
   IF (pasa_pg==2)
    FOR (nar=1; nar<10;nar++)
     sound(s_orpresa,256,256);
    END
   END
     IF (pasa_pg==6)
      unload_pcm(s_orpresa);
      break;
     END
   start_scroll(0,1,pasa_pg,0,0,0);
   fade_on();
  END
  unload_fpg(1);
  load_fpg("neo\p_juan.fpg");
  equis=645; igriega=355;
  libro_leido=1;
  mapea();
END

//---------------------------------------------------------------------------
// PROCESO PARA ESTHER
//---------------------------------------------------------------------------

PROCESS ESTHER(x,y)


BEGIN

load_fpg("neo\esther.fpg");
file=2;
size=90;
ctype=c_scroll;

 LOOP
   graph=1;
  REPEAT
   x+=2;
   flags=0;
   graph++; if (graph==230) graph=1; end
   FRAME;
  UNTIL (x>179)

  REPEAT
   x-=2;
   flags=1;
   graph++; if (graph==230) graph=1; end
   FRAME;
  UNTIL (x<56)
 END

END


