
[{if $oxcmp_basket->getProductsCount()}]  <!-- $bl_perfShowRightBasket &&  -->
[{oxhasrights ident="TOBASKET"}]
<div id="tool_tip">
  [{assign var="currency" value=$oView->getActCurrency() }]
  [{foreach from=$oxcmp_basket->getContents() name=rightlist item=_product}]
  <div nowrap="nowrap">
    [{$_product->getAmount()}] [{ oxmultilang ident="INC_CMP_BASKET_QTY" }]
    [{ assign var="sRightListArtTitle" value=$_product->getTitle() }]
    <a href="[{$_product->getLink()}]" class="picture">
        <img align="middle" src="[{$_product->getImageUrl()}]/[{$_product->getIcon()}]" alt="[{ $sRightListArtTitle|strip_tags }]">
    </a>
    <a href="[{$_product->getLink()}]" class="arttitle">[{ $sRightListArtTitle|strip_tags }]</a>
    [{if $oxcmp_basket->getProductsCount()>1}] ([{$_product->fprice}] [{ $currency->sign}][{if $_product->dAmount>1}]/[{$_product->ftotalprice}] [{ $currency->sign}][{/if}])[{/if}]
  </div>
  [{/foreach}]
  <div class="hr"></div>
  <div class="total" align="right">
    <b>[{ oxmultilang ident="INC_CMP_BASKET_TOTALPRODUCTS" }]</b>&nbsp;
    <b>[{ $oxcmp_basket->getFProductsPrice()}] [{ $currency->sign}]</b> *
  </div>
</div>
  [{/oxhasrights}]
[{/if}]
