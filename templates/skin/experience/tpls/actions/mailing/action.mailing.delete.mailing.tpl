{extends file="_index.tpl"}

{block name="layout_content"}
 <div class="action-header">
	 {include file='menus/menu.talk.tpl'}
 </div>

<div class="panel panel-default topic raised">
	<div class="panel-body">
    
	<form action="" id="mlForm" method="post">
        <div class="fieldset">
            <dl class="mlInfo"> 
                <dt>{$aLang.plugin.mailing.ml_subj} </dt>
                <dd>{$oMailing->getMailingTitle()}</dd>
                <dt>{$aLang.plugin.mailing.ml_status}: </dt>
                <dd>
                    {if ($oMailing->getMailingSend() == $oMailing->getMailingCount())}
                        {$aLang.plugin.mailing.ml_send_all}
                    {elseif ($oMailing->getMailingActive())}
                        {$aLang.plugin.mailing.ml_ready}
                    {else}
                        {$aLang.plugin.mailing.ml_wait}
                    {/if}
                    {if $oMailing->getMailingDirect()}{$aLang.plugin.mailing.ml_send_direct}{/if}
                    {if $oMailing->getMailingTalk()}{$aLang.plugin.mailing.ml_send_talk}{/if}
                </dd>
            </dl>
        </div>
		
		<div style="text-align:center">	
			{$aLang.plugin.mailing.ml_delete_confirm}
			<div style="margin:15px 15px 15px;">
				<input class="btn btn-blue btn-big corner-no" type="submit" name="delete_mailing" style="width:80px" value="{$aLang.plugin.mailing.ml_yes}">
				<input class="btn btn-light btn-big corner-no" type="submit" name="cancel" style="width:80px" value="{$aLang.plugin.mailing.ml_cancel}">
			</div>
		</div>		
    </form>
	
</div>
</div>
{/block}
