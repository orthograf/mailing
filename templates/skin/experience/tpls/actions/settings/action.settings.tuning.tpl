<div class="checkbox mal0">
	<label>
		<input {if !E::User()->getUserNoDigest()}checked{/if} type="checkbox" id="settings_notice_administration" name="settings_notice_administration" value="1"/>{$aLang.plugin.mailing.settings_tuning_notice_administration}
	</label>
</div>
