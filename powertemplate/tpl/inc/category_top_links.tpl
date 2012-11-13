[{if $tree || $oView->getContentCategory() }]
[{assign var="oContentCat" value=$oView->getContentCategory() }]
[{strip}]
    <ul [{if $class}]class="[{$class}]"[{/if}]>
    [{foreach from=$tree item=ocat key=catkey name=$test_catName}]
        [{if $ocat->isTopCategory() && $ocat->getIsVisible() }]
        <li>
            <a id="test_BoxLeft_Cat_[{if $ocat->isTopCategory()}][{$ocat->oxcategories__oxid->value}]_[{$smarty.foreach.$test_catName.iteration}][{else}][{$testSubCat}]_sub[{$smarty.foreach.$test_catName.iteration}][{/if}]" 
            href="[{$ocat->getLink()}]" 
            class="[{if $ocat->isTopCategory()}]root [{/if}][{if $ocat->hasVisibleSubCats}][{if $ocat->expanded }]exp [{/if}]has [{else}]last [{/if}][{if isset($act) && $act->getId()==$ocat->getId() && !$oContentCat }]act [{/if}]">[{$ocat->oxcategories__oxtitle->value}]</a>
        </li>
        [{/if}]
    [{/foreach}]
    </ul>
[{/strip}]
[{/if}]