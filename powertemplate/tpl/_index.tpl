<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
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
    <!--[if lt IE 7]><script type="text/javascript">oxid.popup.addShim();</script><![endif]-->
</head>
[{php}]
//Do the template magic!
$myConfig = oxConfig::getInstance();
include($myConfig->getTemplateDir().'boxes/_boxes.php');
[{/php}]
<body>
  <div id="page">
    <div id="header">
      <div class="bar oxid">
        <a class="logo" href="[{ $oViewConf->getBaseDir() }]">
          <img src="[{$oViewConf->getImageUrl()}]logo.png" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        </a>
        [{$box_MINI_CART}]
        [{$box_ACCOUNT}]        
        [{$box_SERVICE}]        
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
      [{$box_NAVBAR}]
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
    <script type="text/javascript">[{oxscript}][{oxid_include_dynamic file="dyn/oxscript.tpl" }]</script>
  </body>
</html>
