<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>
	<body class="page-{$core.page.name}">
		<section class="section section--navigation">
			<div class="container">
				<div class="nav-bar">
					<div class="navbar-header">
						<a class="brand" href="{$smarty.const.IA_URL}">
							{if !empty($core.config.site_logo)}
								<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
							{else}
								<img src="{$img}logo.png" alt="{$core.config.site}">
							{/if}
						</a>

						<a href="#" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".nav-bar-collapse"><i class="fa fa-bars"></i></a>
					</div>

					<div class="collapse navbar-collapse nav-bar-collapse">
						{ia_blocks block='account'}
						{ia_blocks block='mainmenu'}
						{include 'language-selector.tpl'}
						{include 'currency-selector.tpl'}
					</div>
				</div>
			</div>
		</section>
		<header class="header"{if $core.config.website_bg} style="background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.website_bg}');"{/if}>
			{ia_blocks block='teaser'}
		</header>

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}

		{include file='breadcrumb.tpl'}

		<section class="section section--content{if 'index' != $core.page.name} section--content-inner{/if}">
			<div class="container">

				<div class="row">
					<div class="{width section='content' position='center' tag='col-md-'}">
						<div class="content__wrap">

							{ia_blocks block='top'}

							{if 'index' != $core.page.name}
								<div class="content__header">
									<h1>{$core.page.title}</h1>
									<ul class="content__actions">
										{foreach $core.actions as $name => $action}
											<li>
												{if 'action-favorites' == $name}
													{printFavorites item=$item itemtype=$item.item guests=true}
												{else}
													<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
														<span class="fa fa-{$name}"></span>
													</a>
												{/if}
											</li>
										{/foreach}
									</ul>
								</div>

								{ia_hooker name='smartyFrontBeforeNotifications'}
								{include 'notification.tpl'}

								{ia_hooker name='smartyFrontBeforeMainContent'}

								<div class="content__body">
									{$_content_}
								</div>

								{ia_hooker name='smartyFrontAfterMainContent'}
							{/if}

							{ia_blocks block='bottom'}
						</div>
					</div>
					<div class="{width section='content' position='right' tag='col-md-'} aside">
							{ia_blocks block='right'}
					</div>
				</div>
			</div>
		</section>
			
		{if isset($iaBlocks.verybottom)}
			<div class="section section-light">
				<div class="container">{ia_blocks block='verybottom'}</div>
			</div>
		{/if}
			
		<section class="section section--footer-blocks">
			<div class="container">
				<div class="row">
					<div class="footer-blocks">
						<div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
						<div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
						<div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
						<div class="{width section='footer-blocks' position='footer4' tag='col-md-'}">{ia_blocks block='footer4'}</div>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<div class="container">
			<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
				
			</div>
		</footer>
	
		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include file='visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>