{extends file="_index.tpl"}

{block name="layout_content"}

<div class="action-header">
	 {include file='menus/menu.talk.tpl'}
</div>
 
<div class="panel panel-default panel-table raised">
    <div class="panel-body">

{include file='commons/common.editor.tpl' sImgToLoad='wall-text' sSettingsTinymce='ls.settings.getTinymceComment()' sSettingsMarkitup='ls.settings.getMarkitupComment()'}

<div class="topic">
    <form action="" method="POST" id="mlForm" enctype="multipart/form-data" class="wrapper-content">

		<input type="hidden" name="security_key" value="{$ALTO_SECURITY_KEY}"/>
	
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-header"></i></span>
				<input type="text" class="form-control" id="talk_title" name="subject" value="{$oMailing->getMailingTitle()}"/>
			</div>
		</div>
		
		<div class="note"></div>
		
		<div class="form-group">
			<textarea name="talk_text" id="talk_text" rows="12" class="form-control js-editor-wysiwyg js-editor-markitup">{$oMailing->getMailingText()}</textarea>
		</div>

        <div class="content bg-warning" style="margin: 0 0 15px">
            <span class="input-note">{$aLang.plugin.mailing.ml_edit_warning}</span>
        </div>
		
        <div class="fieldset">
            {$aLang.plugin.mailing.ml_sex}:
            <br />
            <input name="aSex[]" type="checkbox" value="man" {if in_array('man', $oMailing->getMailingSex())}checked="checked"{/if} /> — {$aLang.user_stats_sex_man}
            <br />
            <input name="aSex[]" type="checkbox" value="woman" {if in_array('woman', $oMailing->getMailingSex())}checked="checked"{/if}/> — {$aLang.user_stats_sex_woman}
            <br />
            <input name="aSex[]" type="checkbox" value="other" {if in_array('other', $oMailing->getMailingSex())}checked="checked"{/if}/> — {$aLang.user_stats_sex_other}
            <br />
        </div>
       
        <div style="margin-top:15px;">
            <input class="btn btn-blue btn-big" type="submit" name="submit_mailing_edit" value="{$aLang.plugin.mailing.ml_save}"/>
            <input class="btn btn-light btn-big" type="submit" name="cancel" value="{$aLang.plugin.mailing.ml_cancel}"/>
        </div>
    </form>
</div>

</div>
</div>
{/block}
