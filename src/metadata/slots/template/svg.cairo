use metadata::metadata::common::utils::ArrayConcat;
use metadata::metadata::slots::template::data::TemplateData;


fn generate(data: @TemplateData) -> Span<felt252> {
    let mut svg: Array<felt252> = Default::default();
    print_head_sft_template(ref svg, data);
    svg.span()
}

type Data = TemplateData;

////////////////////////////////////////
//            SVGenerated             //
////////////////////////////////////////
// source file: assets/templates/template.svg

#[inline(always)]
fn print_card_blur(ref svg: Array<felt252>, data: @Data) {
    svg.append('<filter id=\\"card_blur\\" widt');
    svg.append('h=\\"316\\" height=\\"361\\" x=');
    svg.append('\\"0\\" y=\\"-1\\" color-interp');
    svg.append('olation-filters=\\"sRGB\\" filt');
    svg.append('erUnits=\\"userSpaceOnUse\\"><f');
    svg.append('eFlood flood-opacity=\\"0\\" re');
    svg.append('sult=\\"BackgroundImageFix\\" /');
    svg.append('><feBlend in=\\"SourceGraphic\\');
    svg.append('" in2=\\"BackgroundImageFix\\"');
    svg.append(' result=\\"shape\\" /><feGaussi');
    svg.append('anBlur result=\\"effect1_foregr');
    svg.append('oundBlur_3613_174521\\" stdDevi');
    svg.append('ation=\\"2\\" /></filter>');
}
#[inline(always)]
fn print_card_lighting(ref svg: Array<felt252>, data: @Data) {
    svg.append('<filter id=\\"card_lighting\\"');
    svg.append(' width=\\"292\\" height=\\"57\\');
    svg.append('" x=\\"12\\" y=\\"231\\" color-');
    svg.append('interpolation-filters=\\"sRGB\\');
    svg.append('" filterUnits=\\"userSpaceOnUse');
    svg.append('\\"><feFlood flood-opacity=\\"0');
    svg.append('\\" result=\\"BackgroundImageFi');
    svg.append('x\\" /><feBlend in=\\"SourceGra');
    svg.append('phic\\" in2=\\"BackgroundImageF');
    svg.append('ix\\" result=\\"shape\\" /><feC');
    svg.append('olorMatrix in=\\"SourceAlpha\\"');
    svg.append(' result=\\"hardAlpha\\" values=');
    svg.append('\\"0 0 0 0 0 0 0 0 0 0 0 0 0 0');
    svg.append(' 0 0 0 0 127 0\\" /><feOffset d');
    svg.append('y=\\"2\\" /><feGaussianBlur std');
    svg.append('Deviation=\\"4\\" /><feComposit');
    svg.append('e in2=\\"hardAlpha\\" k2=\\"-1');
    svg.append('\\" k3=\\"1\\" operator=\\"arit');
    svg.append('hmetic\\" /><feColorMatrix valu');
    svg.append('es=\\"0 0 0 0 1 0 0 0 0 1 0 0 0');
    svg.append(' 0 1 0 0 0 0.25 0\\" /><feBlend');
    svg.append(' in2=\\"shape\\" result=\\"effe');
    svg.append('ct1_innerShadow_3707_20087\\" /');
    svg.append('></filter>');
}

#[inline(always)]
fn print_head_49439(ref svg: Array<felt252>, data: @Data) {
    svg.append('<defs><pattern id=\\"pattern1\\');
    svg.append('" width=\\"1\\" height=\\"1\\"');
    svg.append(' patternContentUnits=\\"objectB');
    svg.append('oundingBox\\"><use href=\\"#ima');
    svg.append('ge0\\" transform=\\"matrix(.000');
    svg.append('94 0 0 .00082 -.37 0)\\" /></pa');
    svg.append('ttern>');
    print_card_blur(ref svg, data);

    print_card_lighting(ref svg, data);
    svg.append('</defs>');
}

#[inline(always)]
fn print_card_row(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_row\\" letter-spa');
    svg.append('cing=\\"0em\\"><text fill=\\"#D');
    svg.append('0D1D6\\" fill-opacity=\\"0.8\\"');
    svg.append(' font-size=\\"11\\" font-weight');
    svg.append('=\\"500\\"><tspan x=\\"28\\" y=');
    svg.append('\\"252.5\\">Carbon units</tspan');
    svg.append('></text><text fill=\\"#EBECF0\\');
    svg.append('" font-size=\\"14\\" font-weigh');
    svg.append('t=\\"bold\\"><tspan id=\\"asset');
    svg.append('_capacity\\" x=\\"28\\" y=\\"27');
    svg.append('2.091\\">');
    svg.concat(*data.asset_carbon_units);
    svg.append('</tspan></text><text fill=\\"#D');
    svg.append('0D1D6\\" fill-opacity=\\"0.8\\"');
    svg.append(' font-size=\\"11\\" font-weight');
    svg.append('=\\"500\\"><tspan x=\\"117.5\\"');
    svg.append(' y=\\"252.5\\">Ends in</tspan><');
    svg.append('/text><text fill=\\"#EBECF0\\"');
    svg.append(' font-size=\\"14\\" font-weight');
    svg.append('=\\"bold\\"><tspan x=\\"117.5\\');
    svg.append('" y=\\"272.1\\">');
    svg.concat(*data.end_year);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_card_progress(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_progress\\"><text');
    svg.append(' fill=\\"#EFECEA\\" font-size=');
    svg.append('\\"14\\" font-weight=\\"600\\"');
    svg.append(' letter-spacing=\\"0em\\"><tspa');
    svg.append('n x=\\"287\\" y=\\"256.1\\" tex');
    svg.append('t-anchor=\\"end\\">');
    svg.concat(*data.progress);
    svg.append('%</tspan></text>');
    svg.concat(*data.progress_bar_component);
    svg.append('</g>');
}

#[inline(always)]
fn print_head_card_content(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_content\\" filter');
    svg.append('=\\"url(#card_lighting)\\"><rec');
    svg.append('t width=\\"292\\" height=\\"55');
    svg.append('\\" x=\\"12\\" y=\\"231\\" fill');
    svg.append('=\\"#C8C8C8\\" fill-opacity=\\"');
    svg.append('.05\\" rx=\\"8\\" />');
    print_card_row(ref svg, data);

    print_card_progress(ref svg, data);
    svg.append('<rect width=\\"291\\" height=\\');
    svg.append('"54\\" x=\\"12.5\\" y=\\"231.5');
    svg.append('\\" stroke=\\"#D0D1D6\\" stroke');
    svg.append('-opacity=\\".1\\" rx=\\"7.5\\"');
    svg.append(' /></g>');
}

#[inline(always)]
fn print_surface_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"surface_details\\"><te');
    svg.append('xt fill=\\"#D0D1D6\\" fill-opac');
    svg.append('ity=\\"0.8\\" font-size=\\"10\\');
    svg.append('" font-weight=\\"500\\"><tspan');
    svg.append(' x=\\"24\\" y=\\"315.636\\">Sur');
    svg.append('face</tspan></text><text fill=');
    svg.append('\\"#EBECF0\\" font-size=\\"14\\');
    svg.append('" font-weight=\\"bold\\"><tspan');
    svg.append(' id=\\"asset_area\\" x=\\"24\\"');
    svg.append(' y=\\"333.091\\">');
    svg.concat(*data.asset_area_formatted);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_type_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"type_details\\"><text');
    svg.append(' fill=\\"#D0D1D6\\" fill-opacit');
    svg.append('y=\\"0.8\\" font-size=\\"10\\"');
    svg.append(' font-weight=\\"500\\"><tspan x');
    svg.append('=\\"117\\" y=\\"315.636\\">Type');
    svg.append('</tspan></text><text fill=\\"#E');
    svg.append('FECEA\\" font-size=\\"14\\" fon');
    svg.append('t-weight=\\"bold\\"><tspan x=\\');
    svg.append('"117\\" y=\\"333.091\\">');
    svg.concat(*data.project.type_);
    svg.append('</tspan></text></g>');
}

#[inline(always)]
fn print_head_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"details\\" letter-spac');
    svg.append('ing=\\"0em\\">');
    print_surface_details(ref svg, data);

    print_type_details(ref svg, data);
    svg.append('</g>');
}

#[inline(always)]
fn print_sdg_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"sdg_details\\" letter-');
    svg.append('spacing=\\"0em\\"><text fill=\\');
    svg.append('"#D0D1D6\\" fill-opacity=\\"0.8');
    svg.append('\\" font-size=\\"10\\" font-wei');
    svg.append('ght=\\"500\\"><tspan x=\\"233\\');
    svg.append('" y=\\"315.636\\" text-anchor=');
    svg.append('\\"end\\">Impact on</tspan></te');
    svg.append('xt><text fill=\\"#EFECEA\\" fon');
    svg.append('t-size=\\"14\\" font-weight=\\"');
    svg.append('bold\\"><tspan x=\\"233\\" y=\\');
    svg.append('"333.091\\" text-anchor=\\"end');
    svg.append('\\">');
    svg.concat(*data.sdg_count);
    svg.append(' SDG&#x2019;s</tspan></text></g');
    svg.append('>');
}
#[inline(always)]
fn print_sdg_components(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"sdg_components\\">');
    svg.concat(*data.sdg_components);
    svg.append('</g>');
}

#[inline(always)]
fn print_head_sdg(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"sdg\\">');
    print_sdg_details(ref svg, data);

    print_sdg_components(ref svg, data);
    svg.append('</g>');
}


#[inline(always)]
fn print_head_bottom(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"bottom\\">');
    print_head_details(ref svg, data);

    print_head_sdg(ref svg, data);
    svg.append('</g>');
}

#[inline(always)]
fn print_background_image(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"background_image\\" tr');
    svg.append('ansform=\\"matrix(-1 0 0 1 312');
    svg.append(' 3)\\"><rect width=\\"308\\" he');
    svg.append('ight=\\"353\\" rx=\\"8\\" fill=');
    svg.append('\\"url(#pattern0)\\" /><rect wi');
    svg.append('dth=\\"308\\" height=\\"353\\"');
    svg.append(' rx=\\"8\\" fill=\\"url(#paint0');
    svg.append('_linear)\\" /></g>');
}
#[inline(always)]
fn print_68843(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g filter=\\"url(#card_blur)\\"');
    svg.append(' mask=\\"url(#card_mask)\\" tra');
    svg.append('nsform=\\"matrix(-1 0 0 1 312 3');
    svg.append(')\\"><rect width=\\"308\\" heig');
    svg.append('ht=\\"353\\" fill=\\"url(#patte');
    svg.append('rn1)\\" rx=\\"8\\" /><rect widt');
    svg.append('h=\\"308\\" height=\\"353\\" fi');
    svg.append('ll=\\"url(#paint0_linear)\\" rx');
    svg.append('=\\"8\\" /></g>');
}

#[inline(always)]
fn print_head_card_container(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_container\\" filt');
    svg.append('er=\\"url(#filter0_d)\\" clip-p');
    svg.append('ath=\\"url(#clip0)\\">');
    print_background_image(ref svg, data);
    svg.append('<!-- Update transparent card --');
    svg.append('><mask id=\\"card_mask\\" width');
    svg.append('=\\"292\\" height=\\"55\\" x=\\');
    svg.append('"12\\" y=\\"231\\" maskUnits=\\');
    svg.append('"userSpaceOnUse\\" style=\\"mas');
    svg.append('k-type:alpha\\"><rect width=\\"');
    svg.append('292\\" height=\\"55\\" fill=\\"');
    svg.append('url(#pattern0)\\" rx=\\"8\\" tr');
    svg.append('ansform=\\"matrix(-1 0 0 1 304');
    svg.append(' 231)\\" /><rect width=\\"291\\');
    svg.append('" height=\\"54\\" x=\\"-.5\\" y');
    svg.append('=\\".5\\" stroke=\\"#D0D1D6\\"');
    svg.append(' stroke-opacity=\\".1\\" rx=\\"');
    svg.append('7.5\\" transform=\\"matrix(-1 0');
    svg.append(' 0 1 303 231)\\" /></mask>');
    print_68843(ref svg, data);

    print_head_49439(ref svg, data);

    print_head_card_content(ref svg, data);

    print_head_bottom(ref svg, data);
    svg.append('</g>');
}


#[inline(always)]
fn print_head_card(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card\\">');
    print_head_card_container(ref svg, data);
    svg.append('</g>');
}

#[inline(always)]
fn print_column1(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"column1\\" letter-spac');
    svg.append('ing=\\"0em\\"><text fill=\\"#EF');
    svg.append('ECEA\\" font-size=\\"21\\" font');
    svg.append('-weight=\\"bold\\" letter-spaci');
    svg.append('ng=\\"-0.03em\\"><tspan x=\\"20');
    svg.append('\\" y=\\"176.136\\">');
    svg.concat(*data.project.name);
    svg.append('</tspan></text><text fill=\\"#D');
    svg.append('0D1D6\\" fill-opacity=\\"0.8\\"');
    svg.append(' font-size=\\"10\\"><tspan x=\\');
    svg.append('"20.4258\\" y=\\"195.636\\">Bas');
    svg.append('ed in </tspan></text><text fill');
    svg.append('=\\"#D0D1D6\\" font-size=\\"10');
    svg.append('\\" font-weight=\\"600\\"><tspa');
    svg.append('n x=\\"63.668\\" y=\\"195.636\\');
    svg.append('">');
    svg.concat(*data.project.country);
    svg.append('</tspan></text><text fill=\\"#D');
    svg.append('0D1D6\\" fill-opacity=\\"0.8\\"');
    svg.append(' font-size=\\"10\\"><tspan x=\\');
    svg.append('"20\\" y=\\"209.636\\">By </tsp');
    svg.append('an></text><text fill=\\"#D0D1D6');
    svg.append('\\" font-size=\\"10\\" font-wei');
    svg.append('ght=\\"600\\"><tspan x=\\"34.88');
    svg.append('28\\" y=\\"209.636\\">');
    svg.concat(*data.project.developer);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_column2(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"column2\\" letter-spac');
    svg.append('ing=\\"0em\\"><text fill=\\"#D0');
    svg.append('D1D6\\" fill-opacity=\\"0.8\\"');
    svg.append(' font-size=\\"10\\"><tspan x=\\');
    svg.append('"295\\" y=\\"195.636\\" text-an');
    svg.append('chor=\\"end\\">Certified by</ts');
    svg.append('pan></text><text fill=\\"#EFECE');
    svg.append('A\\" font-size=\\"11\\" font-we');
    svg.append('ight=\\"600\\"><tspan x=\\"295');
    svg.append('\\" y=\\"209.5\\" text-anchor=');
    svg.append('\\"end\\">');
    svg.concat(*data.project.certifier);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_card_border(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_border\\">');
    svg.concat(*data.border_component);
    svg.append('</g>');
}

#[inline(always)]
fn print_head_main_info(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"main_info\\">');
    print_column1(ref svg, data);

    print_column2(ref svg, data);

    print_card_border(ref svg, data);
    svg.append('</g>');
}

#[inline(always)]
fn print_status_component(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"status_component\\" fi');
    svg.append('lter=\\"url(#filter1_b)\\">');
    svg.concat(*data.status_component);
    svg.append('</g>');
}

#[inline(always)]
fn print_head_sft(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"sft\\" style=\\"white-');
    svg.append('space: pre\\">');
    print_head_card(ref svg, data);

    print_status_component(ref svg, data);

    print_head_main_info(ref svg, data);
    svg.append('</g>');
}

#[inline(always)]
fn print_filter0_d(ref svg: Array<felt252>, data: @Data) {
    svg.append('<filter id=\\"filter0_d\\" x=\\');
    svg.append('"3\\" y=\\"3\\" width=\\"310\\"');
    svg.append(' height=\\"354\\" filterUnits=');
    svg.append('\\"userSpaceOnUse\\" color-inte');
    svg.append('rpolation-filters=\\"sRGB\\"><f');
    svg.append('eFlood flood-opacity=\\"0\\" re');
    svg.append('sult=\\"BackgroundImageFix\\" /');
    svg.append('><feColorMatrix in=\\"SourceAlp');
    svg.append('ha\\" type=\\"matrix\\" values=');
    svg.append('\\"0 0 0 0 0 0 0 0 0 0 0 0 0 0');
    svg.append(' 0 0 0 0 127 0\\" result=\\"har');
    svg.append('dAlpha\\" /><feMorphology radiu');
    svg.append('s=\\"1\\" operator=\\"dilate\\"');
    svg.append(' in=\\"SourceAlpha\\" result=\\');
    svg.append('"effect1_dropShadow\\" /><feOff');
    svg.append('set /><feColorMatrix type=\\"ma');
    svg.append('trix\\" values=\\"0 0 0 0 0.321');
    svg.append('569 0 0 0 0 0.337255 0 0 0 0 0.');
    svg.append('380392 0 0 0 0.4 0\\" /><feBlen');
    svg.append('d mode=\\"normal\\" in2=\\"Back');
    svg.append('groundImageFix\\" result=\\"eff');
    svg.append('ect1_dropShadow\\" /><feBlend m');
    svg.append('ode=\\"normal\\" in=\\"SourceGr');
    svg.append('aphic\\" in2=\\"effect1_dropSha');
    svg.append('dow\\" result=\\"shape\\" /></f');
    svg.append('ilter>');
}
#[inline(always)]
fn print_filter1_b(ref svg: Array<felt252>, data: @Data) {
    svg.append('<filter id=\\"filter1_b\\" x=\\');
    svg.append('"191\\" y=\\"0\\" width=\\"125');
    svg.append('\\" height=\\"62\\" filterUnits');
    svg.append('=\\"userSpaceOnUse\\" color-int');
    svg.append('erpolation-filters=\\"sRGB\\"><');
    svg.append('feFlood flood-opacity=\\"0\\" r');
    svg.append('esult=\\"BackgroundImageFix\\"');
    svg.append(' /><feGaussianBlur in=\\"Backgr');
    svg.append('oundImageFix\\" stdDeviation=\\');
    svg.append('"10\\" /><feComposite in2=\\"So');
    svg.append('urceAlpha\\" operator=\\"in\\"');
    svg.append(' result=\\"effect1_backgroundBl');
    svg.append('ur\\" /><feBlend mode=\\"normal');
    svg.append('\\" in=\\"SourceGraphic\\" in2=');
    svg.append('\\"effect1_backgroundBlur\\" re');
    svg.append('sult=\\"shape\\" /></filter>');
}

#[inline(always)]
fn print_head_defs(ref svg: Array<felt252>, data: @Data) {
    svg.append('<defs id=\\"defs\\">');
    print_filter0_d(ref svg, data);
    svg.append('<pattern id=\\"pattern0\\" patt');
    svg.append('ernContentUnits=\\"objectBoundi');
    svg.append('ngBox\\" width=\\"1\\" height=');
    svg.append('\\"1\\"><use href=\\"#image0\\"');
    svg.append(' transform=\\"matrix(0.00094407');
    svg.append('2 0 0 0.000823723 -0.365242 0)');
    svg.append('\\" /></pattern>');
    print_filter1_b(ref svg, data);
    svg.append('<linearGradient id=\\"paint0_li');
    svg.append('near\\" x1=\\"231\\" y1=\\"51.5');
    svg.append('\\" x2=\\"310.644\\" y2=\\"330.');
    svg.append('956\\" gradientUnits=\\"userSpa');
    svg.append('ceOnUse\\"><stop stop-color=\\"');
    svg.append('#0B0D13\\" stop-opacity=\\"0.3');
    svg.append('\\" /><stop offset=\\"0.293778');
    svg.append('\\" stop-color=\\"#0B0D13\\" st');
    svg.append('op-opacity=\\"0.7006\\" /><stop');
    svg.append(' offset=\\"0.799813\\" stop-col');
    svg.append('or=\\"#0B0D13\\" stop-opacity=');
    svg.append('\\"0.84\\" /></linearGradient><');
    svg.append('clipPath id=\\"clip0\\"><rect x');
    svg.append('=\\"4\\" y=\\"4\\" width=\\"308');
    svg.append('\\" height=\\"352\\" rx=\\"12\\');
    svg.append('" fill=\\"white\\" /></clipPath');
    svg.append('><image id=\\"image0\\" width=');
    svg.append('\\"1833\\" height=\\"1214\\" hr');
    svg.append('ef=\\"data:image/jpeg;base64,');
    svg.concat(*data.background_image);
    svg.append('\\" /></defs>');
}


#[inline(always)]
fn print_head_sft_template(ref svg: Array<felt252>, data: @Data) {
    svg.append('<svg id=\\"sft_template\\" view');
    svg.append('Box=\\"0 0 316 360\\" fill=\\"n');
    svg.append('one\\" version=\\"1.1\\" xmlns=');
    svg.append('\\"http://www.w3.org/2000/svg\\');
    svg.append('"><style>@import url(https://fo');
    svg.append('nts.googleapis.com/css2?family=');
    svg.append('Inter:wght@400;500;600;700); sv');
    svg.append('g text { -webkit-user-select: n');
    svg.append('one; -moz-user-select: none; -m');
    svg.append('s-user-select: none; user-selec');
    svg.append('t: none; -webkit-tap-highlight-');
    svg.append('color: rgba(255, 255, 255, 0);');
    svg.append(' font-family: Inter; } </style>');
    print_head_sft(ref svg, data);

    print_head_defs(ref svg, data);
    svg.append('</svg>');
}
