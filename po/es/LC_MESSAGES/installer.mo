��    /      �  C           \     	   v     �  "   �  8   �  6   �  .     ;   F     �  3   �  .  �  N     ;   S  n   �  '   �  7   &  5   ^  ;   �  7   �  9   	     B	  #   b	  $   �	     �	     �	  #   �	  )   
     /
     K
     g
     �
     �
  �   �
  0   M  -   ~  0   �     �  '   �  G        g  %   }  (   �  0   �  -   �  %   +     Q  �  p  n   �  	   h     r  '   x  B   �  8   �  8     9   U  #   �  A   �  G  �  M   =  A   �  o   �  4   =  7   r  5   �  9   �  7     7   R      �  #   �  -   �     �       1   5  )   g     �     �     �     �       �   (  8   �  .     4   1     f  &   �  P   �     �  /     2   G  <   z  .   �  )   �  #                     !   	              #                          ,            (      *       "           $         %   .               /                 -                            &                    +   
                '      )               [a]: try automatically
    [s]: spawn a shell to do it manually
    [e]: exit installer
 <command> Bye Cannot connect with www.gentoo.org Chrooting into the new Gentoo system, use `exit` to exit Downloading and installing in the chroot, please wait
 Error: /mnt/gentoo not mounted, please verify. Error: something happended to your shell, please verify it. Great! Now we can start Step 5 Great, we'll continue with step 3 in a few seconds! I had problems to download/extract/install in the chroot, please do
it manually:

    wget -qP /tmp https://github.com/ChrisADR/installer/releases/<desired_release>.tar.gz
    tar xf /tmp/<desired_release>.tar.gz -C /tmp
    cd /tmp/<extracted_dir>
    python setup.py install --prefix=/mnt/gentoo/usr
 I'm going to open a new terminal inside installer,you need to exit with 'exit' If you find this useful or find a bug please contact to: {} Installer implements two ways of installing Gentoo Linux,            from scratch and from an existing system. Not valid option. Select [a],[s] or [e] Please review your gentoo.conf file, something is wrong Please review your make.conf file, something is wrong Please review your repos.conf directory, something is wrong Please review your resolv.conf file, something is wrong Something went wrong with the terminal, please verify it. Step 10: Configuring the system Step 11: Configuring the bootloader Step 1: Welcome to Gentoo installer! Step 2: Preparing the disks Step 3: Installing Stage3 Step 4: Configuring compile options Step 5: Installing the Gentoo base system Step 6: Entering the chroot Step 7: Configuring Portage Step 8: Configuring the system Step 9: Configuring the kernel Thank you for trying installer This prototype was not capable to resolve the issue, please refer 
to Gentoo Handbook, section 'Configuring the network', for more info. Use the arrow to select the step and press ENTER Verifying connectivity with www.gentoo.org... We have connection!Now you can proceed to step 2 Welcome to installer TUI. You need to be root for using installer You need to provide an action, see installer --help or -h for more info available subcommands begin a new Gentoo Linux installation begin on a specific step of installation for specific info use installer <command> --help generate a stageX tarball from current system include /usr/src/ directory in stageX launch Terminal User Interface Project-Id-Version: Installer
Report-Msgid-Bugs-To: chrisadr@gentoo.org
POT-Creation-Date: 2018-04-13 09:57-0500
PO-Revision-Date: 2018-04-13 09:58-0500
Last-Translator: Christopher Díaz Riveros <chrisadr@gentoo.org>
Language-Team: Spanish <chrisadr@gentoo.org>
Language: es
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 2.0.6
     [a]: intentar automáticamente
    [s]: lanzar un shell para hacerlo manualmente
    [e]: salir installer
 <comando> Adios No se puede conectar con www.gentoo.org Entrando al chroot del nuevo sistema Gentoo, usa `exit` para salir Descargando e instalando en el chroot, por favor espera
 Error: /mnt/gentoo no está montado, por favor verifica. Error: algo sucedió con tu shell, por favor verifícalo. ¡Genial! Ahora empecemos el paso 5 ¡Genial, ahora vamos a continuar con el paso 3 en unos segundos! Tuve problemas para descargar/extraer/instalar en el chroot, por favor
realizalo de manera manual:

    wget -qP /tmp https://github.com/ChrisADR/installer/releases/<release_deseado>.tar.gz
    tar xf /tmp/<release_deseado>.tar.gz -C /tmp
    cd /tmp/<directorio_extraído>
    python setup.py install --prefix=/mnt/gentoo/usr
 Voy a abrir un nuevo terminal dentro de installer, necesitas salir con 'exit' Si lo has encontrado útil o algún bug, por favor contacta a: {} Installer implementa dos maneras de installar Gentoo Linux,            desde cero o desde un sistema existente. No es una opción válida. Selecciona [a], [s] o [e] Por favor revisa tu archivo gentoo.conf, algo está mal Por favor revisa tu archivo make.conf, algo está mal Por favor revisa tu directorio repos.conf, algo está mal Por favor revisa tu archivo resolv.conf, algo está mal Algo salió mal con el terminal, por favor verifícalo. Paso 10: Configurando el sistema Paso 11: Configurando el bootloader Paso 1: ¡Bienvenido al instalador de Gentoo! Paso 2: Preparando los discos Paso 3: Instalando Stage3 Paso 4: Configurando las opciones de compilación Paso 5: Instalando el sistema base Gentoo Paso 6: Entrando en el chroot Paso 7: Configurando Portage Paso 8: Configurando el sistema Paso 9: Configurando el kernel Gracias por probar installer Este prototipo no es capaz de resolver el problema, por favor
mira el manual de Instalación de Gentoo, sección 'Configurando la red',
para mayor información. Usa las flecha para seleccionar un paso y presiona ENTER Verificando conectividad con www.gentoo.org... ¡Tenemos conexión! Ahora puedes proceder al paso 2 Bienvenido al TUI de installer. Necesitas ser root para usar installer Necesitas proveer una acción, mira installer --help o -h para más información sub-comandos disponibles comienza una nueva instalación de Gentoo Linux comienza en un paso específico de la instalación para información específica usa installer <comando> --help genera un comprimido stageX del sistema actual incluye el directorio /usr/src/ en stageX lanza la interfaz por consola (TUI) 