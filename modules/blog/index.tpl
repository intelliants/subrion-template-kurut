{if isset($blog_entry)}
	<p class="text-i text-fade-50">{lang key='posted_on'} {$blog_entry.date_added|date_format:$core.config.date_format} {lang key='by'} {$blog_entry.fullname}</p>

	{if $blog_entry.image}
		{ia_image file=$blog_entry.image title=$blog_entry.title|escape:'html' type='large' class='img-responsive m-b'}
	{/if}

	{$blog_entry.body}

	<div class="tags">
		<span class="fa fa-tags"></span>
		{if $blog_tags}
			{lang key='tags'}:
			{foreach $blog_tags as $tag}
				<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">{$tag.title|escape:'html'}</a>{if !$tag@last}, {/if}
			{/foreach}
		{else}
			{lang key='no_tags'}
		{/if}
	</div>

	<hr>
	<!-- AddThis Button BEGIN -->
	<div class="addthis_toolbox addthis_default_style">
		<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
		<a class="addthis_button_tweet"></a>
		<a class="addthis_button_pinterest_pinit"></a>
		<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
		<a class="addthis_counter addthis_pill_style"></a>
	</div>
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5170da8b1f667e6d"></script>
	<!-- AddThis Button END -->
{else}
	{if $blog_entries}
		<div class="ia-items blogroll">
			{foreach $blog_entries as $one_blog_entry}
				<div class="blogroll__item">
					{if $one_blog_entry.image}
						<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="blogroll__item__image">
							{ia_image file=$one_blog_entry.image title=$one_blog_entry.title class='img-responsive' type="large"}
						</a>
					{/if}

					<div class="blogroll__item__header">
						<p class="date">{$one_blog_entry.date_added|date_format:$core.config.date_format}</p>
						<h4><a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" id="blog_{$one_blog_entry.id}">{$one_blog_entry.title}</a></h4>
					</div>
					<div class="ia-item-body">{$one_blog_entry.body|strip_tags|truncate:$core.config.blog_max_block:'...'}</div>
					<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="read-on"><i class="fa fa-eye"></i></a>
				</div>
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_number aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_blog_entries'}</div>
	{/if}
{/if}