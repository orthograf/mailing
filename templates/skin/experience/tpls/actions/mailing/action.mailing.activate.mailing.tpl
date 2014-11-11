{extends file="_index.tpl"}

{block name="layout_content"}

<div class="action-header">
	 {include file='menus/menu.talk.tpl'}
</div>

<div class="topic">
    <form action="" id="mlForm" method="post">
        <div class="fieldset">
            <dl class="mlInfo"> 
                <dt>{$aLang.plugin.mailing.ml_subj} </dt>
                <dd>{$oMailing->getMailingTitle()}</dd>
                <dt>{$aLang.plugin.mailing.ml_status}: </dt>
                <dd>
                    {if ($oMailing->getMailingActive())}
                        {$aLang.plugin.mailing.ml_ready}
                    {else}
                        {$aLang.plugin.mailing.ml_wait}
                    {/if}
                </dd>
                {if $oMailing->getMailingDirect()}
                    <dd>
                        {$aLang.plugin.mailing.ml_send_direct}
                    </dd>
                {/if}
                {if $oMailing->getMailingTalk()}
                    <dd>
                        {$aLang.plugin.mailing.ml_send_talk}
                    </dd>
                {/if}
            </dl>
        </div>
        <div class="fieldset" style="text-align:center">
            {if ($oMailing->getMailingActive())}
                {$aLang.plugin.mailing.ml_deactivation}?
            {else}
                {$aLang.plugin.mailing.ml_activation}?
            {/if}
        </div>
        <div style="text-align:center">
            <input class="btn btn-blue btn-big corner-no" type="submit" name="submit_mailing_activate" value="{$aLang.plugin.mailing.ml_yes}">
            <input class="btn btn-blue btn-big corner-no" type="submit" name="cancel" value="{$aLang.plugin.mailing.ml_no}">
        </div>
    </form>
</div>
{/block}
