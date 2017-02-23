{if isset($block_blog_entries) && $block_blog_entries}
	<div class="ia-items blogroll">
		{foreach $block_blog_entries as $one_blog_entry}
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
	<p class="m-t text-center"><a href="{$smarty.const.IA_URL}blog/" class="btn btn-primary-outline">{lang key='view_all_blog_entries'}</a></p>
{else}
	<div class="alert alert-info">{lang key='no_blog_entries'}</div>
{/if}