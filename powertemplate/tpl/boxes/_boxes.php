<?php
//Avenger
$oView=$this->_tpl_vars['oView'];
$this->_tpl_vars['location']=$GLOBALS['location'];
box_define($this,'navbar');
if ($oView->showSearch())
{
  box_define($this,'search');
}
if ($oView->showNewsletter())
{
  box_define($this,'newsletter');
}
if ($oView->showTopBasket())
{
  box_define($this,'mini_cart');
}
box_define($this,'account');

box_define($this,'cart');

box_define($this,'login');
if ($oView->loadCurrency())
{
  box_define($this,'currencies');
}
if ($oView->isLanguageLoaded())
{
  box_define($this,'languages');
}
if ($oView->getWishlistName())
{
  box_define($this,'whislist_link');
}
if (!$oView->showTopCatNavigation())
{
  box_define($this,'home_link');
}
box_define($this,'agb_link');
box_define($this,'impressum_link');
if ($oView->getMenueList())
{
  box_define($this,'menue_list_link');
}
if ($oView->showTopCatNavigation())
{
  box_define($this,'top_navi');
}
box_define($this,'categories');
if ($oView->loadVendorTree() && $oView->getVendorlist())
{
  box_define($this,'vendors');
}
if ($oView->loadManufacturerTree() && $oView->getManufacturerlist())
{
  box_define($this,'manufacturers');
}
box_define($this,'content');

box_define($this,'service');
if ($this->_tpl_vars['oxcmp_news'] && count($this->_tpl_vars['oxcmp_news']) > 0)
{
  box_define($this,'newsletter');
}
box_define($this,'partners');
if ($oView->getTop5ArticleList())
{
  box_define($this,'bestsellers');
}
$items=$oView->getBargainArticleList();
$items=sizeof($items);
if ($items>0)
{
  box_define($this,'specials');
}  
if (method_exists($oView,'getNewestArticles'))
{
  $items=$oView->getNewestArticles();
  $items=sizeof($items);
  if ($items>0)
  {
    box_define($this,'whatsnew');
  }
}
if (method_exists($oView,'getArticleList'))
{
  $items=$oView->getArticleList();
  $items=sizeof($items);
  if ($items>0)
  {
    box_define($this,'longruns');
  }
}
if ($oView->getSimilarRecommLists())
{
  box_define($this,'tell_friend');
}
if ($oView->getSimilarProducts())
{
  box_define($this,'similiar');
}
if ($oView->getAccessoires())
{
  box_define($this,'accessories');
}
if ($oView->getCrossSelling())
{
  box_define($this,'cross_selling');
}
if ($oView->getAlsoBoughtThiesProducts())
{
  box_define($this,'also_purchased');
}
$box_content=$this->fetch("_footer_pt.tpl");
$this->assign("footer",$box_content);
unset($box_content);

function box_define($smarty,$template_name)
{
  $box_name='box_'.strtoupper($template_name);
  $smarty->assign('box_id',$box_name);
  $box_content=$smarty->fetch("boxes/box_$template_name.tpl");
  $smarty->assign($box_name,$box_content);
}
//Avenger
?>