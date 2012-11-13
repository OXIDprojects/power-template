Im Verzeichnis "powertemplate" befinden sich alle notwendigen Dateien, um das von mir unter

http://www.oxid-esales.com/forum/showthread.php?t=1693

und 

http://www.oxid-esales.com/forum/showthread.php?t=1694

vorgestellte Templating-Konzept zu implementieren.

Eingriffe in den OXID-Core sind nicht notwendig, die notwendigen Modifikationen erfolgen ausschließlich mit Hilfe von "Smarty" innerhalb des Templates.

Mit diesem Template wird das Aussehen des Original OXID-Templates erstellt.

Zum Test sollte unbedingt eine neues Template für OXID erzeugt werden, damit ggfs. das bestehende verwendet werden kann.

Dazu legt man am besten im Verzeichnis "out" von OXID das neue Verzeichnis "powertemplate" an.

Dort hinein kopiert man den Inhalt des bestehenden Templates, bzw. am Anfang besser den Inhalt des Standard-OXID-Templates "basic".

In der Datei "config.inc.php" muss dann die Anweisung:

$this->sTheme = 'basic';

in 

$this->sTheme = 'powertemplate';

geändert werden, damit das neue Template verwendet wird.

In das Verzeichnis 'powertemplate' kopiert man dann das Verzeichnis "tpl" des ZIP-Archivs.

In die Datei "de/cust_lang.php" integriert man dann die Texte aus der Datei "de/cust_lang.php" des ZIP-Archivs.
(Danach alle Dateien im Verzeichnis "tmp" löschen, damit die neuen Texte aktiv werden.)

Was ist der Sinn dieses neuen templating Konzepts?

Es soll helfen, die Strukturierung des Shop-Seitenlayouts zu vereinfachen, insbesondere die Positionierung der diversen Shop-Elemente ("Boxen").

Diese "Boxen" sind im Standard-OXID-Template über die Dateien "_header.tpl", "_left.tpl", "_right.tpl", "_footer.tpl" verteilt, die Abgrenzung der einzelnen Elemente und ihre Verlagerung an andere Stellen auf der Seite ist somit sehr unübersichtlich.

Ebenso unschön ist, dass das HTML-Layout der Shop-Seite nicht an einer Stelle übersichtlich verfügbar ist, sondern die Teile auch über die o.g. Templates verteilt sind.

Und hier setzt jetzt das neue Templating an:

Alle "Boxen" werden als einzelne Elemente separiert, so dass sie als individuelle "Smarty"-Variablen verfügbar sind (eine Voraussetzung, um diese einfach frei plazieren zu können).

Es gibt ein neues Master-Template "_index.tpl", das das HTML-Layout der Seite vollständig beschreibt.

In diesem Master-Template werden die "Boxen" dann über ihren "Smarty"-Namen eingbunden.

Die "Boxen" können dann einfach entfernt, oder auch an andere Stelle im Template verschoben werden.

Übersichtlicher geht es nicht mehr!

Das Master-Template "_index.tpl" hat folgende Struktur:

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html[{if $oView->getActiveLangAbbr()}] lang="[{ $oView->getActiveLangAbbr() }]"[{/if}]>
<head>

    [{assign var="_titlesuffix" value=$_titlesuffix|default:$oView->getTitleSuffix()}]
    [{assign var="title" value=$title|default:$oView->getTitle() }]
    <title>[{$oxcmp_shop->oxshops__oxtitleprefix->value}][{if $title}] | [{$title|strip_tags}][{/if}][{if $_titlesuffix}] | [{$_titlesuffix}][{/if}]</title>
    <meta http-equiv="Content-Type" content="text/html; charset=[{$charset}]">
    [{if $oView->noIndex() == 1 }]
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
    [{elseif $oView->noIndex() == 2 }]
    <meta name="ROBOTS" content="NOINDEX, FOLLOW">
    [{/if}]
    [{if $oView->getMetaDescription()}]<meta name="description" content="[{$oView->getMetaDescription()}]">[{/if}]
    [{if $oView->getMetaKeywords()}]<meta name="keywords" content="[{$oView->getMetaKeywords()}]">[{/if}]
    <link rel="stylesheet" type="text/css" href="[{ $oViewConf->getResourceUrl() }]oxid.css">
    <link rel="shortcut icon" href="[{ $oViewConf->getBaseDir() }]favicon.ico">
    [{if $rsslinks}]
      [{foreach from=$rsslinks item='rssentry'}]
        <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
      [{/foreach}]
    [{/if}]
    <script type="text/javascript" src="[{ $oViewConf->getResourceUrl() }]oxid.js"></script>
    <script type="text/javascript">[{oxscript}][{oxid_include_dynamic file="dyn/oxscript.tpl" }]</script>
    <!--[if lt IE 7]><script type="text/javascript">oxid.popup.addShim();</script><![endif]-->
</head>
[{php}]
//Avenger
//Modified templating concept Copyright 2009 by Avenger, entwicklung@powertemplate.de
//Do the templating magic!
$myConfig = oxConfig::getInstance();
include($myConfig->getTemplateDir().'boxes/_boxes.php');
//Avenger
[{/php}]
<body>
  <div id="page">
    <div id="header">
      <div class="bar oxid">
        <a class="logo" href="[{ $oViewConf->getBaseDir() }]">
          <img src="[{$oViewConf->getImageUrl()}]logo.png" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        </a>
        [{$box_SERVICE}]        
        [{$box_ACCOUNT}]        
        [{$box_MINI_CART}]
        [{$box_TOP_NAVI}]
        <div class="clear"></div>
      </div>
      <div class="bar links[{if !$oView->showTopCatNavigation()}] single[{/if}]">
        <div class="fixed">
          [{$box_LANGUAGES}]
          [{$box_CURRENCIES}]
        </div>
        <div class="left">
          [{$box_HOME_LINK}]
          [{$box_WHISHLIST_LINK}]
        </div>
        <div class="right">
          [{$box_AGB_LINK}]
          [{$box_IMPRESSUM_LINK}]
          [{$box_MENU_LIST_LINK}]
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div id="content">
      <div id="left">
        <div id="left_box">
          [{$box_SEARCH}]
          [{$box_CATEGORIES}]
          [{$box_MANUFACTURERS}]
          [{$box_CONTENT}]
          [{$box_NEWS}]
          [{$box_VENDORS}]
          [{$box_WHATSNEW}]  
          [{$box_LONGRUNS}]  
          [{$box_PARTNERS}]
        </div>
      </div>
      <div id="right">
        <div id="right_box">
          [{$box_CART}]
          [{$box_LOGIN}]
          [{$box_NEWSLETTER}]
          [{$box_BESTSELLERS}]
          [{$box_SPECIALS}]
          [{$box_ACCESSORIES}]
          [{$box_CROSS_SELLING}]
          [{$box_ALSO_PURCHASED}]
          [{$box_SIMILIAR}]
          [{$box_TELL_FRIEND}]
        </div>
      </div>
      <div id="body">
        [{include file="inc/error.tpl" Errorlist=$Errors.default}]
        [{oxid_include_dynamic file="dyn/newbasketitem_message.tpl"}]

        [{$main_content}]
        <div class="clear"></div>
      </div>
      <div id="footer" align="center">
        [{$footer}]
      </div>
    </div>
    <div id="mask"></div>
    [{oxid_include_dynamic file="dyn/newbasketitem_popup.tpl"}]
    [{if $popup}][{include file=$popup}][{/if}]
  </body>
</html>


Die Boxen-Namen sollten selbsterklärend sein, so dass eigentlich jeder weiss, was eine "Box" liefert.

Die Template-Vorlagen für diese "Boxen" befinden sich im Verzeichnis "boxes". Wenn man eine Box ändern will, kann man dort sehr gezielt das zuständige Template indentifizieren.

Jede Box erhält auch ihre eigene "ID" und CSS-Klasse (beides entspricht dem Boxen-Namen), so dass man jede BOX per Javascript und/oder CSS einfach addressieren kann.

Feedback zu evtl. Problemen bitte über das OXID-Forum.

Der xtCommerce-Kenner sieht sofort, dass diese Templating-Konzept sehr ähnlich dem dortigen Templating-Konzept ist, und sich auch die Namensgebung der "Boxen" an die dortige Nomenklatur hält.

Ich halte das xtCommerce Templating-Konzept nach wie vor für das übersichtlichste, was ich bisher so an Templates gesehen habe.

Insbesondere die zur Verfügungstellung der einzelnen Boxen als Smarty-Elemente, die dann über einen Master-Bauplan zusammengeführt werden, ist sehr konsequent und übersichtlich.

Bei den vielen Dingen, die xtCommerce besser machen könnte muss man sage: das ist prima gelungen!


