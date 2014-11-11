{extends file="_index.tpl"}

{block name="layout_vars"}
    {$menu="topics"}
{/block}

{block name="layout_content"}

	<div class="action-header">
        {include file='menus/menu.talk.tpl'}
  </div>	

<div class="panel panel-default panel-table raised">
  <div class="panel-body">

      <div class="topic" style="display: none;">
          <div class="content bg-warning mar0" id="text_preview"></div>
      </div>
      
    <br />
  
    {include file='commons/common.editor.tpl' sImgToLoad='talk_text' sSettingsTinymce='ls.settings.getTinymceComment()' sSettingsMarkitup='ls.settings.getMarkitupComment()'}
    
    <div class="topic">
      <form action="" method="POST" id="mlForm" enctype="multipart/form-data" class="wrapper-content">
      		{hook run='form_add_talk_begin'}
      
      		<input type="hidden" name="security_key" value="{$ALTO_SECURITY_KEY}"/>
      	
      		<div class="form-group">
      			<div class="input-group">
      				<span class="input-group-addon"><i class="fa fa-header"></i></span>
      				<input placeholder="{$aLang.talk_create_title}" type="text" class="form-control" name="subject" id="subject" value="{$_aRequest.subject}"/>
      			</div>
      		</div>
      		
      		<div class="form-group">
      			<textarea name="talk_text" id="talk_text" rows="12" class="form-control js-editor-wysiwyg js-editor-markitup">{$_aRequest.talk_text}</textarea>
      		</div>
      			
              <div class="fieldset">
                  {$aLang.plugin.mailing.ml_sex}:
                  <br />
                  <input name="aSex[]" type="checkbox" value="man" checked="checked"/> — {$aLang.user_stats_sex_man}
                  <br />
                  <input name="aSex[]" type="checkbox" value="woman" checked="checked"/> — {$aLang.user_stats_sex_woman}
                  <br />
                  <input name="aSex[]" type="checkbox" value="other" checked="checked"/> — {$aLang.user_stats_sex_other}
                  <br />
              </div>
              
              <div class="fieldset">
                  <input name="active" id="active" type="checkbox" checked="checked"/> — {$aLang.plugin.mailing.ml_active}
              </div>
                  <br />
              <div class="fieldset">
                  <input id="talk" name="talk" type="checkbox" value="1" {if ($_aRequest.send_talk)}checked="checked"{/if}/> — {$aLang.plugin.mailing.ml_send_talk}
              </div>
      
	    <div style="margin-top:15px;">
	        <input class="btn btn-blue btn-big corner-no" type="submit" name="submit" value="{$aLang.talk_create_submit}" />
		<input type="submit" class="btn btn-light btn-big corner-no" name="submit_preview" onclick="jQuery('#text_preview').parent().show(); ls.tools.textPreview('#talk_text',false); return false;" value="{$aLang.topic_create_submit_preview}" />
	    </div>
        </form>
     </div>
  </div>
</div>

{/block}
