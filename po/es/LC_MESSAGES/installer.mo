��    F      L  a   |         �    �  �  g  �  '  !  H  I    �  a  �  �    O  �  �  "!  2  �"  R  �%  	   6)    @)  /  [,  C   �.  6   �.  .   /  �   5/     0  3   =0  M  q0  Y  �1  y  3  ;   �4  n   �4  ;   >5  |  z5    �6    �8  �  <  8  �>  I  A  N   UC  q   �C  x   D  u   �D  q   E  9   wE     �E  #   �E  $   �E     F     6F  #   PF  )   tF     �F     �F     �F     �F     G  �   3G  �  �G  �  {J  0   kM  -   �M  0   �M     �M  '   N  G   =N  �   �N     ^O  %   tO  (   �O      �O  0   �O  -   P  %   CP     iP  �  �P  �  R  �  �T  �  �X  ^  �[  S  �^  B  6b  {  ye  �  �g  �  �j  �  an  W  �o  g  Is  	   �v  >  �v  @  �y  G   ;|  8   �|  8   �|  �   �|  #   �}  A   �}  M  =~  r  �  u  ��  A   t�  o   ��  M   &�  �  t�    �    !�  �  1�  K  �  H  T�  L   ��  {   �  {   f�  }   �  {   `�  7   ܓ      �  #   5�  -   Y�     ��     ��  1   ��  )   �     �     9�     V�     v�     ��  �   ��  �  S�    /�  8   D�  .   }�  4   ��     �  &   �  P   (�  �   y�     j�  /   ��  2   ��  !   �  <   �  .   E�  )   t�  #   ��     0       1               %             <      C          ,       5   (   
       7           ?   B          +       4   E      8      $   !   @          ;   -      3                       "       A      )       '             =              #   .   /       D              :   6   >                          2   	   &         9              F          *                                   Step 3 - Installing Stage3
================================================================================

Before to be able to download a stage3 tarball, you need to check wheter your
date and time is correct, not doing so could produce unexpected results or it
may be impossible to download it from a trusted mirror.

You can use `date` command to verify. Official Gentoo Installation media
includes `ntpd` command, which may help you in the syncronization. Using ntpd
requires that you send your IP adrress to the time server, if that's a problem
you can set it manually with the `date` command itself.

For more detailed info, please refer to:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage
                             Step 6 - Entering the chroot
================================================================================
Congratulations!! Your are about to enter into your brand new Gentoo system.
Please keep in mind that you need to have /mnt/gentoo mounted and /proc /sys
/dev linked (step 5) and most likely if something goes wrong, you can resume
from here (in most cases and if you don't need to change your partition table
or filesystems and still have internet connection).

The first command will be executed, after that you'll need to execute:

    chroot /mnt/gentoo /bin/bash #DO NOT USE THIS
    source /etc/profile          #(this will set all the ENV variables)
    export PS1="(chroot) $PS1"   #(this will help you to recognize the terminal)

If you created some extra partitions like home or boot, mount them: 

    mkdir /{boot,home}
    mount /dev/sdXy /{boot,home}

Finally, run `installer beginner -s 7` to continue with the installation.
                             Step 7 - Configuring Portage
================================================================================
First of all, welcome to your new Gentoo system! Before you can start enjoying
Gentoo, you need to install your ebuild repository. Please run the following
command:

    emerge-webrsync

Note: Don't worry if Portage complains about missing /usr/portage/ location, the
tool will create the location.

Once sync is done, you'll see a warning about news items in the repository, it's
a good idea to read the news before continue. Use:

    eselect news list
    eselect news read
                             Welcome to generate command
================================================================================
I'll prepare a stageX tarball, after extracting a regular stage3 tarball during
installation, you can extract stageX tarball and you'll have most of the files
needed to finish installation, some of these files include:

    /etc/portage/* : All the required files and subdirectories.
    /var/lib/portage/world : List of currently installed programs.
    /etc/timezone : Current timezone
    /etc/locale.gen : Current locales

Once you extract stageX tarball you'll still need to:

    Update your repository (emerge-webrsync)
    Update @world
    Configure timezone and locales
    Update your /etc/fstab file
    Configure your kenrel.
    Configure your bootloader.
                          Step 10 - Configuring the system
================================================================================
We are almost there, now you need to set the root password, execute:

    passwd

After that you may want to set your host name, you'll need to refer to your init
system's documentation, some examples include:

    nano -w /etc/conf.d/hostname    (OpenRC)
    hostnamectl COMMAND             (SystemD)

This is a good moment to download all the required or desired software that does
not come with the base stage3 tarball, specially networking related software:

    emerge --ask net-misc/networkmanager
    emerge --ask net-misc/dhcpcd
    emerge --ask net-wireless/iw net-wireless/wpa_supplicant

If you need more detailed info, refer to:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Networking
                          Step 2 - Preparing the disks
================================================================================

Now we are going to prepare your block device and make a partition table to be
able to store your filesystems, you have two options:

    MBR (Master Boot Record), you'll need to use fdisk.
    GPT (GUID Partition Table), you'll need to use parted.

Althought this prototype is not designed to generate a partition table, you may
find interesting the next suggestion:

    - You must have a root (/) partition.
    - You'll probably like a /boot partition.
    - You may want a swap partition.
    - You may want a separate /home partition.

For more detailed info, please refer to:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks
                          Step 8 - Configuring the system
================================================================================
Now we need to configure some system-wide settings, first of all timezone. Run:
    
    ls /usr/share/zoneinfo

Choose the right timezone and echo it in /etc/timezone, example:

    echo "America/Lima" > /etc/timezone

Note: Please avoid /usr/share/zoneinfo/Etc/GMT* timezones, they may cause some
strange behaviour.

Once you are finish, please execute:

    emerge --config sys-libs/timezone-data

This will reconfigure timezone-data package and update /etc/localtime
                          Step 9 - Configuring the kernel
================================================================================
Configuring the kernel is one of the most important tasks during installation,
since you are in the beginner section, we highly recommend you to install
genkernel-next. If you want or need to do it manually, please refer to:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel

First of all, download Gentoo's kernel and if you need special drivers (e.g. an
extra driver for a wifi card) download linux-firmware too.

    emerge --ask sys-kernel/gentoo-sources sys-kernel/linux-firmware

After that, emerge genkernel-next:

    emerge --ask sys-kernel/genkernel-next
                         Step 4 - Configuring compile options
================================================================================
Now we need to prepare Portage for the first update. All the env variables used
by Portage are written in /mnt/gentoo/etc/portage/make.conf,for a more detailed
list of all possible variables, refer to:

/mnt/gentoo/usr/share/portage/config/make.conf.example

Since we are going to prepare the first update, we only need to set these
variables:(you can use `nano` or another text editor)

    CFLAGS="-march=native -O2 -pipe"
Explanation:
    -march=native: tells the compiler to select the target
                   architecture of the current system.
    -O2:(capital O letter) gcc optimization class flag, recommended.

    MAKEOPTS="-jX"
Where:
    X: number of CPUs (CPU cores) plus one. Example: -j2
                         Welcome to Gentoo installer!
================================================================================
Before begin we need to make sure that you reach www.gentoo.org to be able to
download stage3 tarball. You can check with: 

    ping -c 2 www.gentoo.org

For more detailed information refer to:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Networking
                        Step 11 - Configuring the bootloader
================================================================================
Last step in the list! You are about to finish the Gentoo installation process!!
Now we need a bootloader, we'll recommend grub, but feel free to install other
if you want to.

Note: UEFI users, please make sure that you have GRUB_PLATFORMS="efi-64" in
your /etc/portage/make.conf file before emerging grub, not doing so may cause
unexpected results.

    echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf

    emerge --ask sys-boot/grub

Then install the bootloader with:

    grub-install /dev/sda

WARNING: UEFI users are highly encouraged to read following section before 
installing grub:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Bootloader#Install
                     Step 5 - Installing the Gentoo base system
================================================================================
If you are using a Official Gentoo Installation media, you may want to select a
mirror to be able to download the source code faster, use the next command:

    mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf

After that, you need to create a directory for your ebuild repository, execute:

    mkdir --parents /mnt/gentoo/etc/portage/repos.conf

And then copy the Gentoo repository configuration file provided by Portage in
the newly created repos.conf directory:

    cp /mnt/gentoo/usr/share/portage/config/repos.conf \
        /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

Finally, copy the DNS info before entering the new environment:

    cp --dereference /etc/resolv.conf /mnt/gentoo/etc
 <command> Before to begin kernel configuration and installation, you need to edit your
/etc/fstab file because genkernel will read it to place initramfs in /boot
partition. This is a good time to leave your /etc/fstab file ready.

    nano -w /etc/fstab

You have to write all your partitions as stated in /etc/fstab itself, once you
are finish, save your changes and execute:

    genkernel --menuconfig all

This will prompt a interactive menu where you have to enable your desired
options, usually default is ok, but if you need some extra info, or you want to
use systemd, these links may help you:
https://wiki.gentoo.org/wiki/Systemd/Installing_Gnome3_from_scratch
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Activating_required_options
https://wiki.gentoo.org/wiki/Wifi#Kernel
 Before to enter the brand new Gentoo system, you need to mount certain
filesystems to be capable to change the Linux root. Use the following commands:

    mount --types proc  /proc   /mnt/gentoo/proc
    mount --rbind       /sys    /mnt/gentoo/sys
    mount --make-rslave         /mnt/gentoo/sys
    mount --rbind       /dev    /mnt/gentoo/dev
    mount --make-rslave         /mnt/gentoo/dev

Note: --make-rslave is needed for systemd support later in installation.

I'll install myself inside the chroot so you'll be able to continue the tutorial
directly.
 Chrooting into the new Gentoo system, run `installer beginner -s 7` Downloading and installing in the chroot, please wait
 Error: /mnt/gentoo not mounted, please verify. Finally, we need you to mount your root partition (/) into /mnt/gentoo. If you
don't have a /mnt/gentoo directory, you can create one with:

    mkdir -p /mnt/gentoo

Then you need to mount it with:

    mount /dev/sdXy /mnt/gentoo
 Great! Now we can start Step 5 Great, we'll continue with step 3 in a few seconds! I couldn't download installer, please download it manually:

    wget -qP /tmp https://github.com/ChrisADR/installer/releases/<desired_release>.tar.gz
    tar xf /tmp/<desired_release>.tar.gz -C /tmp
    cd /tmp/<extracted_dir>
    python setup.py install --prefix=/mnt/gentoo/usr
    python setup.py install_data --root=/mnt/gentoo
 I had problems to extract/install in the chroot, please do
it manually:

    wget -qP /tmp https://github.com/ChrisADR/installer/releases/<desired_release>.tar.gz
    tar xf /tmp/<desired_release>.tar.gz -C /tmp
    cd /tmp/<extracted_dir>
    python setup.py install --prefix=/mnt/gentoo/usr
    python setup.py install_data --root=/mnt/gentoo
 If you are not using systemd as your init system, you need to install a logger:
(You only need ONE from these)
 
    emerge --ask app-admin/sysklogd (recommended for beginners)
    emerge --ask app-admin/syslog-ng
    emerge --ask app-admin/metalog

You may want to read the next section for other optional tools:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Tools
 If you find this useful or find a bug please contact to: {} Installer implements two ways of installing Gentoo Linux,            from scratch and from an existing system. Installer is designed to aid users to install Gentoo Linux. Now that stage3 is located in /mnt/gentoo you can unpack the contents. Please
use the exact command:

    tar xpf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

Explanation:
    x: stands for extract
    p: stands for preserve permissions
    f: stands for file
    --xattrs-include='*.*': preserves extended attributes
    --numeric-owner: keep UID and GID from tarball
 Now that you have a partition table, you need to create a filesystem on each
partition to be able to store data. This prototype assumes that you'll create
ext4 filesystems, some useful commands include:

    mkfs.ext4 /dev/sdXy
where:
    -X is the device letter
    -y is the partition number

To be able to create a swap partition, you can use:

    mkswap /dev/sdXy
    swapon /dev/sdXy

For more detailed info please refer to:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks#Creating_file_systems
 Now you need the download a stage3 tarball. Stage3 contains all the required
data to be able to build your system. Check the next URL for a mirror list:

https://www.gentoo.org/downloads/mirrors/

Once you find the perfect mirror, you need to download a stage3 for your
specific architecture. Usually you'll find a URL like:

protocol://mirror/releases/amd64/autobuilds/stage3_dir/stage3*.{bz2|xz}

Move to /mnt/gentoo and use one of the following commands:
    wget <URL>
    links <URL> and choose the tarball in the cli-browser

Remember to download .DIGEST or .DIGEST.asc if you want to verify and validate
the stage3 tarball.

More information about validation and verification please refer to:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage#Verifying_and_validating
 Now you need to configure grub, this way it'll be able to find your partitions
and initramfs. Execute:

    grub-mkconfig -o /boot/grub/grub.cfg

If you have no error messages, CONGRATULATIONS! you have now a fully installed
Gentoo system. But before finishing this tutorial, you need to check a couple
things:

-Start/enable all the needed services: e.g. if you installed NetworkManager:

    systemctl enable NetworkManager         (SystemD)
    rc-update add NetworkManager default    (OpenRC)
-Install your Window Manager or Desktop Environment: e.g. GNOME or Plasma
    
    emerge --ask [gnome|plasma|i3]
-Create a new user:

    useradd -m -G users,wheel,audio -s /bin/bash larry
    passwd larry
 Now you need to select a profile for building your system. you can use `eselect`
for listing available profiles:

    eselect profile list

To set the desired profile execute:

    eselect profile set <number>

Please consider to read the profiles section in Gentoo Handbook for more
detailed info:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Base#Choosing_the_right_profile

Once your are done, you need to update your system to the new profile, execute:

    emerge --ask --update --deep --newuse @world

This may be a long process, please be patient.
 Now you need to set your locales, for that you'll have to edit /etc/locale.gen:
    
    nano -w /etc/locale.gen

Warning: we strongly suggest to use at least one UTF-8 locale, as example:

    en_US.UTF-8 UTF-8
    es_PE.UTF-8 UTF-8
    en_US ISO-8859-1
    de_DE ISO-8859-1

Once you have all the desired locales, generate them running:

    locale-gen

Finally, set your desired locale (if you have more than one) with `eselect` and
reload the environment:

    eselect locale list
    eselect locale set <number>
    env-update && source /etc/profile && export PS1="(chroot) $PS1"
 Opening new shell inside installer, use 'exit' to close and show next message: Please review your gentoo.conf file, something is wrong
If you need the text again, run 'installer beginner -s 5' Please review your make.conf file, something is wrong,
 you can resume with 'installer beginner -s 4' once you fixed it. Please review your repos.conf directory, something is wrong
If you need the text again, run 'installer beginner -s 5' Please review your resolv.conf file, something is wrong
If you need the text again, run 'installer beginner -s 5' Something went wrong with the terminal, please verify it. Step 10: Configuring the system Step 11: Configuring the bootloader Step 1: Welcome to Gentoo installer! Step 2: Preparing the disks Step 3: Installing Stage3 Step 4: Configuring compile options Step 5: Installing the Gentoo base system Step 6: Entering the chroot Step 7: Configuring Portage Step 8: Configuring the system Step 9: Configuring the kernel Thank you for trying installer This prototype was not capable to resolve the issue, please refer 
to Gentoo Handbook, section 'Configuring the network', for more info. To clean installer from your new Gentoo system; exit the chroot with 'exit',
then execute:

    installer cleanup

Finally, you need to umount all the linked directories:

    umount -l /mnt/gentoo/dev{/shm,/pts,}
    umount -R /mnt/gentoo

We recommend you to read these sections to work with Gentoo and Portage:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Portage

If you are reading this message this could mean that now you have your own
Gentoo system, thank your for trying installer and if you find any bug or error,
even if you have enhancement ideas, feel free to email me:

    chrisadr@gentoo.org

Thank you :) and enjoy Gentoo!
 USE flags help you to customize the building process, by default, each profile
contains the recommended USE flags to be able to run the base system. If you
need to add or remove some of them, it's highly suggested to read Handbook's
section:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working

Specially:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working#When_Portage_is_complaining
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working#Using_USE_flags

If after reading these sections you still find problems, you can contact by IRC
in #gentoo channel.

Edit your /etc/portage/make.conf file in order to set the desired USE flags.
Then save your changes and update your system with:

    emerge --ask --update --deep --newuse @world
 Use the arrow to select the step and press ENTER Verifying connectivity with www.gentoo.org... We have connection!Now you can proceed to step 2 Welcome to installer TUI. You need to be root for using installer You need to provide an action, see installer --help or -h for more info Your /dev/shm directory is a symbolic link, please run:
    rm /dev/shm && mkdif /dev/shm
    mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
Also ensure that mode 1777 is set:
    chmod 1777 /dev/shm
 available subcommands begin a new Gentoo Linux installation begin on a specific step of installation clean installer from /mnt/gentoo for specific info use installer <command> --help generate a stageX tarball from current system include /usr/src/ directory in stageX launch Terminal User Interface Project-Id-Version: Installer
Report-Msgid-Bugs-To: chrisadr@gentoo.org
POT-Creation-Date: 2018-05-02 19:09-0500
PO-Revision-Date: 2018-05-02 19:39-0500
Last-Translator: Christopher Díaz Riveros <chrisadr@gentoo.org>
Language-Team: Spanish <chrisadr@gentoo.org>
Language: es
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 2.0.6
                             Paso 3 - Instalando Stage3
================================================================================

Antes de poder descargar un comprimido stage3, necesitas revisar si la
fecha y hora son correctas, no hacerlo producirá resultados inesperados o
incluso hacer imposible la descarga desde un mirror de confianza.

Puedes usar el comando `date` para verificar. El medio oficial de instalación 
incluye el comando `ntpd`, que puede ayudar a sincronizar. Usar ntpd
requiere que envíes tu IP al servidor de tiempo, si eso es un problema
puedes configurar de manera manual usando el comando `date`.

Para más información por favor revisa:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage
                             Paso 6 - Entrando en el chroot
================================================================================
¡Felicidades! Estás a punto de entrar en tu nuevo sistema Gentoo. Por
favor recuerda que si estás en este punto, debes revisar que todos los
filesystems necesarios están vinculados (paso 5) y si por alguna razón 
algo va mal, puedes resumir desde aquí (en la mayoría de los casos
no necesitas cambiar tu tabla de particiones o los filesystems, y
deberías tener conexión a internet).

El primer comando será ejecutado, luego tu necesitas ejecutar: 

    chroot /mnt/gentoo /bin/bash #ESTE NO LO EJECUTES
    source /etc/profile          #(configura tus variables de entorno)
    export PS1="(chroot) $PS1"   #(ayudará a reconocer la terminal)

Si creaste otras particiones extra como home o boot, montalas ahora:

    mkdir /{boot,home}
    mount /dev/sdXy /{boot,home}

Finalmente, ejecuta `installer beginner -s 7` para continuar con la instalación.
                             Paso 7 - Configurando Portage
================================================================================
Antes que nada, ¡bienvenido a tu nuevo sistema Gentoo! Antes de disfrutar
Gentoo, necesitas instalar tu repositorio de ebuilds. Por favor ejecuta los
siguientes comandos:

    emerge-webrsync

Nota: No te preocupes si Portage se queja sobre ubicaciones faltantes como
/usr/portage/ , la herramienta generará las ubicaciones.

Una vez la sincronización esté completada, verás una advertencia sobre noticias
en el repositorio, es una buena idea leer las noticias antes de continuar. Usa:

    eselect news list
    eselect news read
                             Bienvenido al comando generate 
================================================================================
Voy a preparar un comprimido stageX, tras extraer un comprimido stage3 durante
una instalación, puedes extraer el stageX y tendrás la mayoría de los archivos 
necesarios para terminar la instalación, algunos de estos archivos incluyen:

    /etc/portage/* : Todos los archivos y subdirectorios.
    /var/lib/portage/world : Lista de programas instalados actualmente.
    /etc/timezone : Timezone actual
    /etc/locale.gen : Locales actuales

Una vez extraído el stageX todavía necesitarás realizar lo siguiente:

    Actualizar tu repositorio (emerge-webrsync)
    Actualizar @world
    Configurar tu timezone y locales
    Actualizar tu archivo /etc/fstab
    Configurar tu kenrel.
    Configurar tu bootloader.
                          Paso 10 - Configurando el sistema
================================================================================
Ya casi hemos acabado, ahora necesita configurar la clave de root, ejecute:

    passwd

Después, tal vez quiera configurar el hostname, necesitará referirse a la
documentación de su sistema init, algunos ejemplos incluyen:

    nano -w /etc/conf.d/hostname    (OpenRC)
    hostnamectl COMMAND             (SystemD)

Este es un buen momento para descargar todo el software deseado que no
viene por defecto en un comprimido stage3, como los relacionados a redes:

    emerge --ask net-misc/networkmanager
    emerge --ask net-misc/dhcpcd
    emerge --ask net-wireless/iw net-wireless/wpa_supplicant

Si necesita información más detallada, revise:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Networking
                          Paso 2 - Preparando los discos
================================================================================

Ahora vamos a preparar los discos y hacer una tabla de particiones para
poder guardar tu filesystem, tienes dos opciones:

    MBR (Master Boot Record), necesitarás usar fdisk.
    GPT (GUID Partition Table), necesitarás usar parted.

Aunque este prototipo no está diseñado para generar una tabla de
particiones, tal vez encuentres interesante la siguiente sugerencia:

    - Tienes que tener una partición raíz (/).
    - Probablemente quieras una partición /boot.
    - Tal vez quieras una partición swap.
    - Tal vez quieras una partición /home separada.

Para información más detallada, revisa el siguiente link:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks/es
                          Paso 8 - Configurando el sistema
================================================================================
Necesitamos configurar opciones del sistema, primero los timezone. Ejecuta:
    
    ls /usr/share/zoneinfo

Escoge la timezone adecuada y usa echo para dirigirla a /etc/timezone, ejemplo:

    echo "America/Lima" > /etc/timezone

Nota: Por favor evita los timezones /usr/share/zoneinfo/Etc/GMT* , pueden
causar comportamientos extraños.

Una vez terminado, por favor ejecuta:

    emerge --config sys-libs/timezone-data

Esto configurará tu paquete timezone-data y actualizará /etc/localtime
                          Step 9 - Configurando el kernel
================================================================================
Configurar el kernel es una de las tareas más importantes durante la instalación
dado que es la sección de principiantes, recomendamos que instale
genkernel-next. Si desea o necesita hacerlo manualmente, por favor revise:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel

Antes que nada, descargar el kernel de Gentoo y si necesita drivers especiales
(p. e., un driver extra para una tarjeta de wifi) descargue linux-firmware.

    emerge --ask sys-kernel/gentoo-sources sys-kernel/linux-firmware

Luego, descargue genkernel-next:

    emerge --ask sys-kernel/genkernel-next
                         Paso 4 - Configurando opciones de compilación
================================================================================
Ahora necesitamos preparar Portage para la primer actualización. Todas las
variables usadaspor Portage están escritas en 
/mnt/gentoo/etc/portage/make.conf, para información más detallada
de la lista de variables posibles, revisa:

/mnt/gentoo/usr/share/portage/config/make.conf.example

Dado que vamos a preparar la primer actualización, solo necesitas configurar
estas variables:(puedes usar `nano` u otro editor de texto)

    CFLAGS="-march=native -O2 -pipe"
Explanation:
    -march=native: le dice al compilador que seleccione la
                   arquitectura del sistema actual.
    -O2:(letra O mayúscula) opción de optimización de gcc, recomendada.

    MAKEOPTS="-jX"
Donde:
    X: número de CPUs (núcleos de CPU) más uno. Ejemplo: -j2
                         ¡Bienvenido a installer!
================================================================================
Antes de comenzar necesitamos asegurar que hay conexión con www.gentoo.org
para poder descargar el comprimido stage3. Puedes revisar con:

    ping -c 2 www.gentoo.org

Para más detalles referir a:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Networking
                        Paso 11 - Configurando el bootloader
================================================================================
¡Último paso!¡Estás por finalizar el proceso de instalación de Gentoo!
Ahora necesitamos un bootloader, recomendamos grub, pero siéntase
libre de instalar otro si así lo desea.

Nota: usuarios UEFI, por favor asegúrense que tienen configurado 
GRUB_PLATFORMS="efi-64" en su archivo /etc/portage/make.conf 
antes de instalar grub, no hacerlo puede causar resultados inesperados.

    echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf

    emerge --ask sys-boot/grub

Luego instale el bootloader con:

    grub-install /dev/sda

ADVERTENCIA: usuarios UEFI, les recomendamos leer la siguiente sección ANTES
de instalar grub:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Bootloader#Install
                     Paso 5 - Instalando el sistema base de Gentoo
================================================================================
Si estás usando un medio oficial de instalación, tal vez quieras elegir un
mirror para poder descargar el código fuente más rápido, usa este comando:

    mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf

Después, necesitas crear un directorio para tu repositorio de ebuilds, ejecuta:

    mkdir --parents /mnt/gentoo/etc/portage/repos.conf

Y luego copia la configuración de repositorio por defecto provista por Portage
en el recién creado directorio repos.conf:

    cp /mnt/gentoo/usr/share/portage/config/repos.conf \
        /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

Finalmente, copia la información DNS antes de entrar en el nuevo ambiente:

    cp --dereference /etc/resolv.conf /mnt/gentoo/etc
 <comando> Antes de comenzar la configuración del kernel y la instalación, necesita editar
su archivo /etc/fstab porque genkernel lo leerá para poder poner el initramfs
en la partición /boot. Este es un buen momento para dejar /etc/fstab listo.

    nano -w /etc/fstab

Tiene que escribir sus particiones como muestra el mismo /etc/fstab,
una vez finalizado, guarde sus cambios y ejecute:

    genkernel --menuconfig all

Esto lanzará un menú interactivo donde tiene que habilitar las opciones
deseadas, usualmente los default están bien, pero si necesita información
extra, o quiere usar systemd, estos links pueden ser de ayuda:

https://wiki.gentoo.org/wiki/Systemd/Installing_Gnome3_from_scratch
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Activating_required_options
https://wiki.gentoo.org/wiki/Wifi#Kernel
 Antes de entrar en el nuevo sistema Gentoo, necesitas montar ciertos
filesystems para poder cambiar el root de Linux. Usa los siguientes comandos:

    mount --types proc  /proc   /mnt/gentoo/proc
    mount --rbind       /sys    /mnt/gentoo/sys
    mount --make-rslave         /mnt/gentoo/sys
    mount --rbind       /dev    /mnt/gentoo/dev
    mount --make-rslave         /mnt/gentoo/dev

Nota: --make-rslave es necesario para soportar systemd luego en la instalación.

Me voy a instalar dentro del chroot para que puedas continuar
el tutorial desde el interior del chroot.
 Entrando al chroot del nuevo sistema, ejecuta `installer beginner -s 7` Descargando e instalando en el chroot, por favor espera
 Error: /mnt/gentoo no está montado, por favor verifica. Finalmente, necesitamos montar tu partición raíz (/) en /mnt/gentoo. Si no
tienes un directorio /mnt/gentoo , puedes crear uno con:

    mkdir -p /mnt/gentoo

Después lo puedes montar con:

    mount /dev/sdXy /mnt/gentoo
 ¡Genial! Ahora empecemos el paso 5 ¡Genial, ahora vamos a continuar con el paso 3 en unos segundos! No pude descargar installer, hazlo de manera manual:

    wget -qP /tmp https://github.com/ChrisADR/installer/releases/<release_deseado>.tar.gz
    tar xf /tmp/<release_deseado>.tar.gz -C /tmp
    cd /tmp/<directorio_extraído>
    python setup.py install --prefix=/mnt/gentoo/usr
    python setup.py install_data --root=/mnt/gentoo
 Tuve problemas para extraer/instalar en el chroot, por favor
realizalo de manera manual:

    wget -qP /tmp https://github.com/ChrisADR/installer/releases/<release_deseado>.tar.gz
    tar xf /tmp/<release_deseado>.tar.gz -C /tmp
    cd /tmp/<directorio_extraído>
    python setup.py install --prefix=/mnt/gentoo/usr
    python setup.py install_data --root=/mnt/gentoo

 Si no está usando systemd como sistema init, necesita instalar un logger:
(Solo necesita UNO de estos)
 
    emerge --ask app-admin/sysklogd (recomendado para principiantes)
    emerge --ask app-admin/syslog-ng
    emerge --ask app-admin/metalog

Tal vez quiera leer la siguiente sección sobre herramientas:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Tools
 Si lo has encontrado útil o algún bug, por favor contacta a: {} Installer implementa dos maneras de installar Gentoo Linux,            desde cero o desde un sistema existente. Installer está diseñado para ayudar a los usuarios a instalar Gentoo Linux. Ahora que stage3 está ubicado en /mnt/gentoo puedes extraer el contenido.
Por favor usa el siguiente comando:

    tar xpf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

Explicación:
    x: para extraer
    p: para preservar los permisos
    f: para seleccionar un archivo
    --xattrs-include='*.*': preserva atributos extendidos
    --numeric-owner: mantiene UID y GID del comprimido
 Ahora que tienes una tabla de particiones, necesitas crear un filesystem en cada
partición para poder almacenar data. Este prototipo asume que vas a crear
filesystems de tipo ext4, algunos comandos útils incluyen:

    mkfs.ext4 /dev/sdXy
donde:
    -X es la letra de la dispositivo de bloque
    -y es el número de partición

Para poder crear una partición swap, puedes usar:

    mkswap /dev/sdXy
    swapon /dev/sdXy

Para más información revisa:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks#Creating_file_systems
 Ahora necesitas descargar el comprimido stage3. Stage3 contiene toda la data
requerida para poder construir un sistema. Revisa la lista de mirror en el link:

https://www.gentoo.org/downloads/mirrors/

Una vez encontrado un mirror, puedes descargar stage3 para tu
arquitectura específica. Usualmente un URL como:

protocol://mirror/releases/amd64/autobuilds/stage3_dir/stage3*.{bz2|xz}

Muevete a /mnt/gentoo y usa uno de los siguietnes comandos:
    wget <URL>
    links <URL> y escoge el comprimido en el navegador por consola

Recuerda descargar el .DIGEST o .DIGEST.asc si quieres verificar y validar
el comprimido stage3.

Para más información sobre verificación y validación, visita:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage#Verifying_and_validating
 Ahora necesitas configurar grub, de este modo podrá encontrar las particiones
y el initramfs. Ejecute:

    grub-mkconfig -o /boot/grub/grub.cfg

Si no aparecen mensajes de error, ¡FELICIDADES! ahora tienes un sistema Gentoo
totalmente instalado. Pero antes de finalizar este tutorial, necesitas revisar 
un par de cosas:

-Inicia los servicioes necesarios: por ejemplo, si instalaste NetworkManager:

    systemctl enable NetworkManager         (SystemD)
    rc-update add NetworkManager default    (OpenRC)
-Instala tu Window Manager o Desktop Environment: por ejemplo, GNOME o Plasma
    
    emerge --ask [gnome|plasma|i3]
-Crea un nuevo usuario:

    useradd -m -G users,wheel,audio -s /bin/bash larry
    passwd larry
 Ahora necesitas seleccionar un perfil para tu sistema, puedes usar `eselect`
para listar los perfiles disponibles:

    eselect profile list

Para elegir el perfil ejecuta:

    eselect profile set <número>

Por favor considera leer la sección perfiles en el Gentoo Handbook para
información más detallada:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Base#Choosing_the_right_profile

Una vez completado, necesitas actualizar tu sistema al nuevo perfil, ejecuta:

    emerge --ask --update --deep --newuse @world

Este puede ser un proceso largo, por favor se paciente.
 Ahora configura tus locales, para eso tendrás que editar /etc/locale.gen:
    
    nano -w /etc/locale.gen

Advertencia: recomendamos usar al menos un locale de tipo UTF-8, como ejemplo:

    en_US.UTF-8 UTF-8
    es_PE.UTF-8 UTF-8
    en_US ISO-8859-1
    de_DE ISO-8859-1

Una vez que tengas todas las locales, genéralas ejecutando:

    locale-gen

Finalmente, configura tus locales deseadas (si tienes más de una) con
`eselect` y recarga el ambiente:

    eselect locale list
    eselect locale set <número>
    env-update && source /etc/profile && export PS1="(chroot) $PS1"
 Abriendo nuevo shell, usa 'exit' para cerrar y mostrar el siguiente mensaje: Por favor revisa tu archivo gentoo.conf, algo está mal
Si deseas leer el texto otra vez, ejecuta 'installer beginner -s 5' Por favor revisa tu archivo make.conf, algo está mal,
puedes resumir con 'installer beginner -s 4' cuando esté arreglado. Por favor revisa tu directorio repos.conf, algo está mal
Si deseas leer el texto otra vez, ejecuta 'installer beginner -s 5' Por favor revisa tu archivo resolv.conf, algo está mal
Si deseas leer el texto otra vez, ejecuta 'installer beginner -s 5' Algo salió mal con el terminal, por favor verifícalo. Paso 10: Configurando el sistema Paso 11: Configurando el bootloader Paso 1: ¡Bienvenido al instalador de Gentoo! Paso 2: Preparando los discos Paso 3: Instalando Stage3 Paso 4: Configurando las opciones de compilación Paso 5: Instalando el sistema base Gentoo Paso 6: Entrando en el chroot Paso 7: Configurando Portage Paso 8: Configurando el sistema Paso 9: Configurando el kernel Gracias por probar installer Este prototipo no es capaz de resolver el problema, por favor
mira el manual de Instalación de Gentoo, sección 'Configurando la red',
para mayor información. Para limpiar installer del nuevo sistema Gentoo; salga del chroot con 'exit',
luego ejecute:

    installer cleanup

Finalmente, necesita desmontar los directorios vinculados:

    umount -l /mnt/gentoo/dev{/shm,/pts,}
    umount -R /mnt/gentoo

Recomendamos las siguientes secciones para trabajar con Gentoo y Portage:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Portage

Si estás leyendo este mensaje podría significar que ahora tienes tu propio 
sistema Gentoo, gracias por probar installer y si encontraste algún bug o error,
incluso si tienes ideas para mejorarlo, siéntete libre de mandarme un mail:

    chrisadr@gentoo.org

Gracias :) y ¡disfruta Gentoo!
 Los flags USE ayudan a customizar el proceso de construcción. Por defecto,
cada perfil contiene los USE flags recomendados para poder correr el sistema
base. Si necesitas agregar o remover algunas de estas, es recomendable leer 
la siguiente sección del Handbook:

https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working

Especialmente:
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working#When_Portage_is_complaining
https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working#Using_USE_flags

Si tras leer estas secciones todavía tienes problemas, puedes solicitar
ayuda por IRC en el canal #gentoo .

Edita tu archivo /etc/portage/make.conf para poder modificar los USE flags.
Luego guarda tus cambios y actualiza tu sistema con:

    emerge --ask --update --deep --newuse @world
 Usa las flecha para seleccionar un paso y presiona ENTER Verificando conectividad con www.gentoo.org... ¡Tenemos conexión! Ahora puedes proceder al paso 2 Bienvenido al TUI de installer. Necesitas ser root para usar installer Necesitas proveer una acción, mira installer --help o -h para más información Tu directorio /dev/shm es un link simbólico, por favor ejecuta:
    rm /dev/shm && mkdif /dev/shm
    mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
También revisa que el modo esté configurado en:
    chmod 1777 /dev/shm
 sub-comandos disponibles comienza una nueva instalación de Gentoo Linux comienza en un paso específico de la instalación eliminar installer de /mnt/gentoo para información específica usa installer <comando> --help genera un comprimido stageX del sistema actual incluye el directorio /usr/src/ en stageX lanza la interfaz por consola (TUI) 