# { stdenv, dpkg, glibc, gcc-unwrapped, autoPatchelfHook , qt5}:
with import <nixpkgs> {};
let

  # Please keep the version x.y.0.z and do not update to x.y.76.z because the
  # source of the latter disappears much faster.
  version = "1.2.1";

  src = ./robot-settings_linux64_1.2.1-6c3a1204f_20210902-182550.tar.gz;

in stdenv.mkDerivation rec {
  name = "robosettings-${version}";

  system = "x86_64-linux";

  boost164 = callPackage ./boost164.nix  { };
  #icu55 = callPackage ./icu55.nix { };
  icu55 = callPackage ./icu55.nix ({
    nativeBuildRoot = buildPackages.icu55.override { buildRootOnly = true; };
  } //
    (lib.optionalAttrs (stdenv.hostPlatform.isi686 && stdenv.cc.isGNU) {
      stdenv = gcc6Stdenv; # with gcc-7: undefined reference to `__divmoddi4'
    }));

  # Required for compilation
  nativeBuildInputs = [
    autoPatchelfHook # Automatically setup the loader, and do the magic
    qt5.full
    boost164
    python27Full
    opencv3
    avahi
    tinyxml2
    icu55
  ];

  # Required at running time
  buildInputs = [
    glibc
    gcc-unwrapped
    stdenv.cc.cc.lib
    qt5.full
    boost164
    python27Full
    opencv3
    avahi
    tinyxml2
    icu55
  ];

  inherit src;

  dontConfigure = true;
  dontBuild = true;


  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/lib
    echo "source is: $src";
    # tar xvzf $src
    find . -type d
    cp bin/robot_settings $out/bin/robot_settings
    cp lib/librobotsettings.so $out/lib/librobotsettings.so

    cp /nix/store/cs1bsamr2g5r78wnzz0pgszs6c8kw0s0-tinyxml-2.6.2/lib/libtinyxml.so $out/lib/libtinyxml.so.2.6.2

    cp lib/libalaudio.so $out/lib/libalaudio.so
    cp lib/libalautomatictest.so $out/lib/libalautomatictest.so
    cp lib/libalcommon.so $out/lib/libalcommon.so
    cp lib/libalerror.so $out/lib/libalerror.so
    cp lib/libalextractor.so $out/lib/libalextractor.so
    cp lib/liballauncher.so $out/lib/liballauncher.so
    cp lib/libalmathinternal.so $out/lib/libalmathinternal.so
    cp lib/libalmath.so $out/lib/libalmath.so
    cp lib/libalmemoryfastaccess.so $out/lib/libalmemoryfastaccess.so
    cp lib/libalproxies.so $out/lib/libalproxies.so
    cp lib/libalpythontools.so $out/lib/libalpythontools.so
    cp lib/libalserial.so $out/lib/libalserial.so
    cp lib/libalthread.so $out/lib/libalthread.so
    cp lib/libalvalue.so $out/lib/libalvalue.so
    cp lib/libalvalueutils.so $out/lib/libalvalueutils.so
    cp lib/libalvision.so $out/lib/libalvision.so
    cp lib/libapplication_settings.so $out/lib/libapplication_settings.so
    cp lib/libapplication_translation.so $out/lib/libapplication_translation.so
    cp lib/libaudiolanguage.so $out/lib/libaudiolanguage.so
    cp lib/libavahi-client.so $out/lib/libavahi-client.so
    cp lib/libavahi-common.so $out/lib/libavahi-common.so
    cp lib/libavahi-core.so $out/lib/libavahi-core.so
    cp lib/libboost_atomic.so $out/lib/libboost_atomic.so
    cp lib/libboost_chrono.so $out/lib/libboost_chrono.so
    cp lib/libboost_container.so $out/lib/libboost_container.so
    cp lib/libboost_context.so $out/lib/libboost_context.so
    cp lib/libboost_coroutine.so $out/lib/libboost_coroutine.so
    cp lib/libboost_date_time.so $out/lib/libboost_date_time.so
    cp lib/libboost_fiber.so $out/lib/libboost_fiber.so
    cp lib/libboost_filesystem.so $out/lib/libboost_filesystem.so
    cp lib/libboost_graph.so $out/lib/libboost_graph.so
    cp lib/libboost_iostreams.so $out/lib/libboost_iostreams.so
    cp lib/libboost_locale.so $out/lib/libboost_locale.so
    cp lib/libboost_log_setup.so $out/lib/libboost_log_setup.so
    cp lib/libboost_log.so $out/lib/libboost_log.so
    cp lib/libboost_math_c99f.so $out/lib/libboost_math_c99f.so
    cp lib/libboost_math_c99l.so $out/lib/libboost_math_c99l.so
    cp lib/libboost_math_c99.so $out/lib/libboost_math_c99.so
    cp lib/libboost_math_tr1f.so $out/lib/libboost_math_tr1f.so
    cp lib/libboost_math_tr1l.so $out/lib/libboost_math_tr1l.so
    cp lib/libboost_math_tr1.so $out/lib/libboost_math_tr1.so
    cp lib/libboost_prg_exec_monitor.so $out/lib/libboost_prg_exec_monitor.so
    cp lib/libboost_program_options.so $out/lib/libboost_program_options.so
    cp lib/libboost_python.so $out/lib/libboost_python.so
    cp lib/libboost_random.so $out/lib/libboost_random.so
    cp lib/libboost_regex.so $out/lib/libboost_regex.so
    cp lib/libboost_serialization.so $out/lib/libboost_serialization.so
    cp lib/libboost_signals.so $out/lib/libboost_signals.so
    cp lib/libboost_system.so $out/lib/libboost_system.so
    cp lib/libboost_thread.so $out/lib/libboost_thread.so
    cp lib/libboost_timer.so $out/lib/libboost_timer.so
    cp lib/libboost_type_erasure.so $out/lib/libboost_type_erasure.so
    cp lib/libboost_unit_test_framework.so $out/lib/libboost_unit_test_framework.so
    cp lib/libboost_wave.so $out/lib/libboost_wave.so
    cp lib/libboost_wserialization.so $out/lib/libboost_wserialization.so
    cp lib/libconnection2_feature_audio_device.so $out/lib/libconnection2_feature_audio_device.so
    cp lib/libconnection2_feature_battery.so $out/lib/libconnection2_feature_battery.so
    cp lib/libconnection2_feature_cloud.so $out/lib/libconnection2_feature_cloud.so
    cp lib/libconnection2_feature_connection_manager.so $out/lib/libconnection2_feature_connection_manager.so
    cp lib/libconnection2_feature_dialog.so $out/lib/libconnection2_feature_dialog.so
    cp lib/libconnection2_feature_health_monitor.so $out/lib/libconnection2_feature_health_monitor.so
    cp lib/libconnection2_feature_life.so $out/lib/libconnection2_feature_life.so
    cp lib/libconnection2_feature_memory.so $out/lib/libconnection2_feature_memory.so
    cp lib/libconnection2_feature_motion.so $out/lib/libconnection2_feature_motion.so
    cp lib/libconnection2_feature_notification_manager.so $out/lib/libconnection2_feature_notification_manager.so
    cp lib/libconnection2_feature_package_manager.so $out/lib/libconnection2_feature_package_manager.so
    cp lib/libconnection2_feature_preferences_manager.so $out/lib/libconnection2_feature_preferences_manager.so
    cp lib/libconnection2_feature_speech_recognition.so $out/lib/libconnection2_feature_speech_recognition.so
    cp lib/libconnection2_feature_store.so $out/lib/libconnection2_feature_store.so
    cp lib/libconnection2_feature_system.so $out/lib/libconnection2_feature_system.so
    cp lib/libconnection2_feature_tablet.so $out/lib/libconnection2_feature_tablet.so
    cp lib/libconnection2_feature_text_to_speech.so $out/lib/libconnection2_feature_text_to_speech.so
    cp lib/libconnection2.so $out/lib/libconnection2.so
    cp lib/libcrypto.so $out/lib/libcrypto.so
    cp lib/libfocus_impl.so $out/lib/libfocus_impl.so
    cp lib/libfocus.so $out/lib/libfocus.so
    cp lib/libgeometry_module.so $out/lib/libgeometry_module.so
    cp lib/libgmock_main.so $out/lib/libgmock_main.so
    cp lib/libgmock.so $out/lib/libgmock.so
    cp lib/libgtest_main.so $out/lib/libgtest_main.so
    cp lib/libgtest.so $out/lib/libgtest.so
    cp lib/libicudata.so $out/lib/libicudata.so
    cp lib/libicui18n.so $out/lib/libicui18n.so
    cp lib/libicuio.so $out/lib/libicuio.so
    cp lib/libicule.so $out/lib/libicule.so
    cp lib/libiculx.so $out/lib/libiculx.so
    cp lib/libicutest.so $out/lib/libicutest.so
    cp lib/libicutu.so $out/lib/libicutu.so
    cp lib/libicuuc.so $out/lib/libicuuc.so
    cp lib/libinterfaceprovider.so $out/lib/libinterfaceprovider.so
    cp lib/liblanguage.so $out/lib/liblanguage.so
    cp lib/libmdns_avahi.so $out/lib/libmdns_avahi.so
    cp lib/libmdnsmanager.so $out/lib/libmdnsmanager.so
    cp lib/libmdnsservice.so $out/lib/libmdnsservice.so
    cp lib/libnetworkconnectionpage.so $out/lib/libnetworkconnectionpage.so
    cp lib/libnetworkinfo.so $out/lib/libnetworkinfo.so
    cp lib/libnotificationadder.so $out/lib/libnotificationadder.so
    cp lib/libnotificationmanager.so $out/lib/libnotificationmanager.so
    cp lib/libnotifications.so $out/lib/libnotifications.so
    cp lib/libompl.so $out/lib/libompl.so
    cp lib/libopencv_calib3d.so $out/lib/libopencv_calib3d.so
    cp lib/libopencv_core.so $out/lib/libopencv_core.so
    cp lib/libopencv_dnn.so $out/lib/libopencv_dnn.so
    cp lib/libopencv_features2d.so $out/lib/libopencv_features2d.so
    cp lib/libopencv_flann.so $out/lib/libopencv_flann.so
    cp lib/libopencv_highgui.so $out/lib/libopencv_highgui.so
    cp lib/libopencv_imgcodecs.so $out/lib/libopencv_imgcodecs.so
    cp lib/libopencv_imgproc.so $out/lib/libopencv_imgproc.so
    cp lib/libopencv_ml.so $out/lib/libopencv_ml.so
    cp lib/libopencv_objdetect.so $out/lib/libopencv_objdetect.so
    cp lib/libopencv_photo.so $out/lib/libopencv_photo.so
    cp lib/libopencv_shape.so $out/lib/libopencv_shape.so
    cp lib/libopencv_stitching.so $out/lib/libopencv_stitching.so
    cp lib/libopencv_superres.so $out/lib/libopencv_superres.so
    cp lib/libopencv_videoio.so $out/lib/libopencv_videoio.so
    cp lib/libopencv_video.so $out/lib/libopencv_video.so
    cp lib/libopencv_videostab.so $out/lib/libopencv_videostab.so
    cp lib/libopn.so $out/lib/libopn.so
    cp lib/liborocos-bfl.so $out/lib/liborocos-bfl.so
    cp lib/libpreferences_file.so $out/lib/libpreferences_file.so
    cp lib/libqicontextfactory_module.so $out/lib/libqicontextfactory_module.so
    cp lib/libqicontext.so $out/lib/libqicontext.so
    cp lib/libqicore.so $out/lib/libqicore.so
    cp lib/libqigeometry.so $out/lib/libqigeometry.so
    cp lib/libqilang.so $out/lib/libqilang.so
    cp lib/libqilocale_module.so $out/lib/libqilocale_module.so
    cp lib/libqilocale.so $out/lib/libqilocale.so
    cp lib/libqipackagehelper.so $out/lib/libqipackagehelper.so
    cp lib/libqipackage.so $out/lib/libqipackage.so
    cp lib/libqiqt.so $out/lib/libqiqt.so
    cp lib/libqi.so $out/lib/libqi.so
    cp lib/libQt53DAnimation.so $out/lib/libQt53DAnimation.so
    cp lib/libQt53DCore.so $out/lib/libQt53DCore.so
    cp lib/libQt53DExtras.so $out/lib/libQt53DExtras.so
    cp lib/libQt53DInput.so $out/lib/libQt53DInput.so
    cp lib/libQt53DLogic.so $out/lib/libQt53DLogic.so
    cp lib/libQt53DQuickAnimation.so $out/lib/libQt53DQuickAnimation.so
    cp lib/libQt53DQuickExtras.so $out/lib/libQt53DQuickExtras.so
    cp lib/libQt53DQuickInput.so $out/lib/libQt53DQuickInput.so
    cp lib/libQt53DQuickRender.so $out/lib/libQt53DQuickRender.so
    cp lib/libQt53DQuickScene2D.so $out/lib/libQt53DQuickScene2D.so
    cp lib/libQt53DQuick.so $out/lib/libQt53DQuick.so
    cp lib/libQt53DRender.so $out/lib/libQt53DRender.so
    cp lib/libQt5Bluetooth.so $out/lib/libQt5Bluetooth.so
    cp lib/libQt5Charts.so $out/lib/libQt5Charts.so
    cp lib/libQt5Concurrent.so $out/lib/libQt5Concurrent.so
    cp lib/libQt5Core.so $out/lib/libQt5Core.so
    cp lib/libQt5DBus.so $out/lib/libQt5DBus.so
    cp lib/libQt5DesignerComponents.so $out/lib/libQt5DesignerComponents.so
    cp lib/libQt5Designer.so $out/lib/libQt5Designer.so
    cp lib/libQt5EglFSDeviceIntegration.so $out/lib/libQt5EglFSDeviceIntegration.so
    cp lib/libQt5EglFsKmsSupport.so $out/lib/libQt5EglFsKmsSupport.so
    cp lib/libQt5Gamepad.so $out/lib/libQt5Gamepad.so
    cp lib/libQt5Gui.so $out/lib/libQt5Gui.so
    cp lib/libQt5Help.so $out/lib/libQt5Help.so
    cp lib/libQt5Location.so $out/lib/libQt5Location.so
    cp lib/libQt5MultimediaGstTools.so $out/lib/libQt5MultimediaGstTools.so
    cp lib/libQt5MultimediaQuick.so $out/lib/libQt5MultimediaQuick.so
    cp lib/libQt5Multimedia.so $out/lib/libQt5Multimedia.so
    cp lib/libQt5MultimediaWidgets.so $out/lib/libQt5MultimediaWidgets.so
    cp lib/libQt5Network.so $out/lib/libQt5Network.so
    cp lib/libQt5Nfc.so $out/lib/libQt5Nfc.so
    cp lib/libQt5OpenGL.so $out/lib/libQt5OpenGL.so
    cp lib/libQt5PositioningQuick.so $out/lib/libQt5PositioningQuick.so
    cp lib/libQt5Positioning.so $out/lib/libQt5Positioning.so
    cp lib/libQt5PrintSupport.so $out/lib/libQt5PrintSupport.so
    cp lib/libQt5Qml.so $out/lib/libQt5Qml.so
    cp lib/libQt5QuickControls2.so $out/lib/libQt5QuickControls2.so
    cp lib/libQt5QuickParticles.so $out/lib/libQt5QuickParticles.so
    cp lib/libQt5QuickShapes.so $out/lib/libQt5QuickShapes.so
    cp lib/libQt5Quick.so $out/lib/libQt5Quick.so
    cp lib/libQt5QuickTemplates2.so $out/lib/libQt5QuickTemplates2.so
    cp lib/libQt5QuickTest.so $out/lib/libQt5QuickTest.so
    cp lib/libQt5QuickWidgets.so $out/lib/libQt5QuickWidgets.so
    cp lib/libQt5RemoteObjects.so $out/lib/libQt5RemoteObjects.so
    cp lib/libQt5Scxml.so $out/lib/libQt5Scxml.so
    cp lib/libQt5Sensors.so $out/lib/libQt5Sensors.so
    cp lib/libQt5SerialBus.so $out/lib/libQt5SerialBus.so
    cp lib/libQt5SerialPort.so $out/lib/libQt5SerialPort.so
    cp lib/libQt5Sql.so $out/lib/libQt5Sql.so
    cp lib/libQt5Svg.so $out/lib/libQt5Svg.so
    cp lib/libQt5Test.so $out/lib/libQt5Test.so
    cp lib/libQt5TextToSpeech.so $out/lib/libQt5TextToSpeech.so
    cp lib/libQt5WaylandClient.so $out/lib/libQt5WaylandClient.so
    cp lib/libQt5WaylandCompositor.so $out/lib/libQt5WaylandCompositor.so
    cp lib/libQt5WebChannel.so $out/lib/libQt5WebChannel.so
    cp lib/libQt5WebSockets.so $out/lib/libQt5WebSockets.so
    cp lib/libQt5WebView.so $out/lib/libQt5WebView.so
    cp lib/libQt5Widgets.so $out/lib/libQt5Widgets.so
    cp lib/libQt5X11Extras.so $out/lib/libQt5X11Extras.so
    cp lib/libQt5XcbQpa.so $out/lib/libQt5XcbQpa.so
    cp lib/libQt5XmlPatterns.so $out/lib/libQt5XmlPatterns.so
    cp lib/libQt5Xml.so $out/lib/libQt5Xml.so
    cp lib/libqtconcurrency_helper.so $out/lib/libqtconcurrency_helper.so
    cp lib/librobotbrowser_model.so $out/lib/librobotbrowser_model.so
    cp lib/librobotbrowser_qml.so $out/lib/librobotbrowser_qml.so
    cp lib/librobot_language_controller.so $out/lib/librobot_language_controller.so
    cp lib/librobotlanguage.so $out/lib/librobotlanguage.so
    cp lib/librobotsettings.so $out/lib/librobotsettings.so
    cp lib/librobotutils.so $out/lib/librobotutils.so
    cp lib/librttools.so $out/lib/librttools.so
    cp lib/libssh_qt_mockup.so $out/lib/libssh_qt_mockup.so
    cp lib/libssh_qt.so $out/lib/libssh_qt.so
    cp lib/libssh.so $out/lib/libssh.so
    cp lib/libssl.so $out/lib/libssl.so
    cp lib/libsystemnotification.so $out/lib/libsystemnotification.so
    cp lib/libtheme_utils.so $out/lib/libtheme_utils.so
    cp lib/libtinyxml.so $out/lib/libtinyxml.so
    cp lib/libwizard_navigation.so $out/lib/libwizard_navigation.so
    cp lib/libz.so $out/lib/libz.so

  '';



  # meta = with stdenv.lib; {
  #   description = "Wolframscript";
  #   homepage = https://www.wolfram.com/wolframscript/;
  #   license = licenses.mit;
  #   maintainers = with stdenv.lib.maintainers; [ ];
  #   platforms = [ "x86_64-linux" ];
  # };
}
