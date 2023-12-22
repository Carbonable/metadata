use metadata::metadata::common::utils::ArrayConcat;
use metadata::metadata::slots::template::data::TemplateData;


fn generate(data: @TemplateData) -> Span<felt252> {
    let mut svg: Array<felt252> = Default::default();
    svg.append('data:image/svg+xml,');
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
fn print_head_90180(ref svg: Array<felt252>, data: @Data) {
    svg.append('<defs><pattern id=\\"pattern1\\');
    svg.append('" width=\\"1\\" height=\\"1\\"');
    svg.append(' patternContentUnits=\\"objectB');
    svg.append('oundingBox\\"><use href=\\"%23i');
    svg.append('mage0\\" transform=\\"matrix(.0');
    svg.append('0094 0 0 .00082 -.37 0)\\" /></');
    svg.append('pattern>');
    print_card_blur(ref svg, data);

    print_card_lighting(ref svg, data);
    svg.append('</defs>');
}

#[inline(always)]
fn print_card_row(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_row\\"><text fill');
    svg.append('=\\"%23D0D1D6\\" fill-opacity=');
    svg.append('\\"0.8\\" font-size=\\"11\\" fo');
    svg.append('nt-weight=\\"500\\"><tspan x=\\');
    svg.append('"28\\" y=\\"252.5\\">Carbon uni');
    svg.append('ts</tspan></text><text fill=\\"');
    svg.append('%23EBECF0\\" font-size=\\"14\\"');
    svg.append(' font-weight=\\"bold\\"><tspan');
    svg.append(' id=\\"asset_capacity\\" x=\\"2');
    svg.append('8\\" y=\\"272.091\\">');
    svg.concat(*data.asset_total_capacity);
    svg.append('</tspan></text><text fill=\\"%2');
    svg.append('3D0D1D6\\" fill-opacity=\\"0.8');
    svg.append('\\" font-size=\\"11\\" font-wei');
    svg.append('ght=\\"500\\"><tspan x=\\"117.5');
    svg.append('\\" y=\\"252.5\\">Ends in</tspa');
    svg.append('n></text><text fill=\\"%23EBECF');
    svg.append('0\\" font-size=\\"14\\" font-we');
    svg.append('ight=\\"bold\\"><tspan x=\\"117');
    svg.append('.5\\" y=\\"272.1\\">');
    svg.concat(*data.end_year);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_card_progress(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_progress\\"><text');
    svg.append(' fill=\\"%23EFECEA\\" font-size');
    svg.append('=\\"14\\" font-weight=\\"600\\"');
    svg.append('><tspan x=\\"287\\" y=\\"256.1');
    svg.append('\\" text-anchor=\\"end\\">');
    svg.concat(*data.progress);
    svg.append('%</tspan></text>');
    svg.concat(*data.progress_bar_component);
    svg.append('</g>');
}

#[inline(always)]
fn print_head_card_content(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_content\\" filter');
    svg.append('=\\"url(%23card_lighting)\\"><r');
    svg.append('ect width=\\"292\\" height=\\"5');
    svg.append('5\\" x=\\"12\\" y=\\"231\\" fil');
    svg.append('l=\\"%23C8C8C8\\" fill-opacity=');
    svg.append('\\".05\\" rx=\\"8\\" />');
    print_card_row(ref svg, data);

    print_card_progress(ref svg, data);
    svg.append('<rect width=\\"291\\" height=\\');
    svg.append('"54\\" x=\\"12.5\\" y=\\"231.5');
    svg.append('\\" stroke=\\"%23D0D1D6\\" stro');
    svg.append('ke-opacity=\\".1\\" rx=\\"7.5\\');
    svg.append('" /></g>');
}

#[inline(always)]
fn print_surface_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"surface_details\\"><te');
    svg.append('xt fill=\\"%23D0D1D6\\" fill-op');
    svg.append('acity=\\"0.8\\" font-size=\\"10');
    svg.append('\\" font-weight=\\"500\\"><tspa');
    svg.append('n x=\\"24\\" y=\\"315.636\\">Su');
    svg.append('rface</tspan></text><text fill=');
    svg.append('\\"%23EBECF0\\" font-size=\\"14');
    svg.append('\\" font-weight=\\"bold\\"><tsp');
    svg.append('an id=\\"asset_area\\" x=\\"24');
    svg.append('\\" y=\\"333.091\\">');
    svg.concat(*data.asset_area_formatted);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_type_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"type_details\\"><text');
    svg.append(' fill=\\"%23D0D1D6\\" fill-opac');
    svg.append('ity=\\"0.8\\" font-size=\\"10\\');
    svg.append('" font-weight=\\"500\\"><tspan');
    svg.append(' x=\\"117\\" y=\\"315.636\\">Ty');
    svg.append('pe</tspan></text><text fill=\\"');
    svg.append('%23EFECEA\\" font-size=\\"14\\"');
    svg.append(' font-weight=\\"bold\\"><tspan');
    svg.append(' x=\\"117\\" y=\\"333.091\\">');
    svg.concat(*data.project.type_);
    svg.append('</tspan></text></g>');
}

#[inline(always)]
fn print_head_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"details\\">');
    print_surface_details(ref svg, data);

    print_type_details(ref svg, data);
    svg.append('</g>');
}

#[inline(always)]
fn print_sdg_details(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"sdg_details\\"><text f');
    svg.append('ill=\\"%23D0D1D6\\" fill-opacit');
    svg.append('y=\\"0.8\\" font-size=\\"10\\"');
    svg.append(' font-weight=\\"500\\"><tspan x');
    svg.append('=\\"233\\" y=\\"315.636\\" text');
    svg.append('-anchor=\\"end\\">Impact on</ts');
    svg.append('pan></text><text fill=\\"%23EFE');
    svg.append('CEA\\" font-size=\\"14\\" font-');
    svg.append('weight=\\"bold\\"><tspan x=\\"2');
    svg.append('33\\" y=\\"333.091\\" text-anch');
    svg.append('or=\\"end\\">');
    svg.concat(*data.sdg_count);
    svg.append(' SDG&%23x2019;s</tspan></text><');
    svg.append('/g>');
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
    svg.append('\\"url(%23pattern0)\\" /><rect');
    svg.append(' width=\\"308\\" height=\\"353');
    svg.append('\\" rx=\\"8\\" fill=\\"url(%23p');
    svg.append('aint0_linear)\\" /></g>');
}
#[inline(always)]
fn print_15780(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g filter=\\"url(%23card_blur)');
    svg.append('\\" mask=\\"url(%23card_mask)\\');
    svg.append('" transform=\\"matrix(-1 0 0 1');
    svg.append(' 312 3)\\"><rect width=\\"308\\');
    svg.append('" height=\\"353\\" fill=\\"url(');
    svg.append('%23pattern1)\\" rx=\\"8\\" /><r');
    svg.append('ect width=\\"308\\" height=\\"3');
    svg.append('53\\" fill=\\"url(%23paint0_lin');
    svg.append('ear)\\" rx=\\"8\\" /></g>');
}

#[inline(always)]
fn print_head_card_container(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"card_container\\" filt');
    svg.append('er=\\"url(%23filter0_d)\\" clip');
    svg.append('-path=\\"url(%23clip0)\\">');
    print_background_image(ref svg, data);
    svg.append('<!-- Update transparent card --');
    svg.append('><mask id=\\"card_mask\\" width');
    svg.append('=\\"292\\" height=\\"55\\" x=\\');
    svg.append('"12\\" y=\\"231\\" maskUnits=\\');
    svg.append('"userSpaceOnUse\\" style=\\"mas');
    svg.append('k-type:alpha\\"><rect width=\\"');
    svg.append('292\\" height=\\"55\\" fill=\\"');
    svg.append('url(%23pattern0)\\" rx=\\"8\\"');
    svg.append(' transform=\\"matrix(-1 0 0 1 3');
    svg.append('04 231)\\" /><rect width=\\"291');
    svg.append('\\" height=\\"54\\" x=\\"-.5\\"');
    svg.append(' y=\\".5\\" stroke=\\"%23D0D1D6');
    svg.append('\\" stroke-opacity=\\".1\\" rx=');
    svg.append('\\"7.5\\" transform=\\"matrix(-');
    svg.append('1 0 0 1 303 231)\\" /></mask>');
    print_15780(ref svg, data);

    print_head_90180(ref svg, data);

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
    svg.append('<g id=\\"column1\\"><text fill=');
    svg.append('\\"%23EFECEA\\" font-size=\\"21');
    svg.append('\\" font-weight=\\"bold\\" lett');
    svg.append('er-spacing=\\"-0.03em\\"><tspan');
    svg.append(' x=\\"20\\" y=\\"176.136\\">');
    svg.concat(*data.project.name);
    svg.append('</tspan></text><text fill=\\"%2');
    svg.append('3D0D1D6\\" fill-opacity=\\"0.8');
    svg.append('\\" font-size=\\"10\\"><tspan x');
    svg.append('=\\"20.4258\\" y=\\"195.636\\">');
    svg.append('Based in </tspan></text><text f');
    svg.append('ill=\\"%23D0D1D6\\" font-size=');
    svg.append('\\"10\\" font-weight=\\"600\\">');
    svg.append('<tspan x=\\"63.668\\" y=\\"195.');
    svg.append('636\\">');
    svg.concat(*data.project.country);
    svg.append('</tspan></text><text fill=\\"%2');
    svg.append('3D0D1D6\\" fill-opacity=\\"0.8');
    svg.append('\\" font-size=\\"10\\"><tspan x');
    svg.append('=\\"20\\" y=\\"209.636\\">By </');
    svg.append('tspan></text><text fill=\\"%23D');
    svg.append('0D1D6\\" font-size=\\"10\\" fon');
    svg.append('t-weight=\\"600\\"><tspan x=\\"');
    svg.append('34.8828\\" y=\\"209.636\\">');
    svg.concat(*data.project.developer);
    svg.append('</tspan></text></g>');
}
#[inline(always)]
fn print_column2(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"column2\\"><text fill=');
    svg.append('\\"%23D0D1D6\\" fill-opacity=\\');
    svg.append('"0.8\\" font-size=\\"10\\"><tsp');
    svg.append('an x=\\"295\\" y=\\"195.636\\"');
    svg.append(' text-anchor=\\"end\\">Certifie');
    svg.append('d by</tspan></text><text fill=');
    svg.append('\\"%23EFECEA\\" font-size=\\"11');
    svg.append('\\" font-weight=\\"600\\"><tspa');
    svg.append('n x=\\"295\\" y=\\"209.5\\" tex');
    svg.append('t-anchor=\\"end\\">');
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
    svg.append('lter=\\"url(%23filter1_b)\\">');
    svg.concat(*data.status_component);
    svg.append('</g>');
}

#[inline(always)]
fn print_head_sft(ref svg: Array<felt252>, data: @Data) {
    svg.append('<g id=\\"sft\\">');
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
    svg.append('\\"1\\"><use href=\\"%23image0');
    svg.append('\\" transform=\\"matrix(0.00094');
    svg.append('4072 0 0 0.000823723 -0.365242');
    svg.append(' 0)\\" /></pattern>');
    print_filter1_b(ref svg, data);
    svg.append('<linearGradient id=\\"paint0_li');
    svg.append('near\\" x1=\\"231\\" y1=\\"51.5');
    svg.append('\\" x2=\\"310.644\\" y2=\\"330.');
    svg.append('956\\" gradientUnits=\\"userSpa');
    svg.append('ceOnUse\\"><stop stop-color=\\"');
    svg.append('%230B0D13\\" stop-opacity=\\"0.');
    svg.append('3\\" /><stop offset=\\"0.293778');
    svg.append('\\" stop-color=\\"%230B0D13\\"');
    svg.append(' stop-opacity=\\"0.7006\\" /><s');
    svg.append('top offset=\\"0.799813\\" stop-');
    svg.append('color=\\"%230B0D13\\" stop-opac');
    svg.append('ity=\\"0.84\\" /></linearGradie');
    svg.append('nt><clipPath id=\\"clip0\\"><re');
    svg.append('ct x=\\"4\\" y=\\"4\\" width=\\');
    svg.append('"308\\" height=\\"352\\" rx=\\"');
    svg.append('12\\" fill=\\"white\\" /></clip');
    svg.append('Path><image id=\\"image0\\" wid');
    svg.append('th=\\"1833\\" height=\\"1214\\"');
    svg.append(' href=\\"data:image/jpeg;base64');
    svg.append(',');
    svg.concat(*data.background_image);
    svg.append('\\" /></defs>');
}


#[inline(always)]
fn print_head_sft_template(ref svg: Array<felt252>, data: @Data) {
    svg.append('<svg id=\\"sft_template\\" widt');
    svg.append('h=\\"316\\" height=\\"360\\" vi');
    svg.append('ewBox=\\"0 0 316 360\\" fill=\\');
    svg.append('"none\\" version=\\"1.1\\" xmln');
    svg.append('s=\\"http://www.w3.org/2000/svg');
    svg.append('\\" preserveAspectRatio=\\"xMid');
    svg.append('YMid meet\\"><style>@import url');
    svg.append('(https://fonts.googleapis.com/c');
    svg.append('ss2?family=Inter:wght@400;500;6');
    svg.append('00;700); svg text { -webkit-use');
    svg.append('r-select: none; -moz-user-selec');
    svg.append('t: none; -ms-user-select: none;');
    svg.append(' user-select: none; -webkit-tap');
    svg.append('-highlight-color: rgba(255, 255');
    svg.append(', 255, 0); font-family: Inter;');
    svg.append(' } </style>');
    print_head_sft(ref svg, data);

    print_head_defs(ref svg, data);
    svg.append('</svg>');
}
