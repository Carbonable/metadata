use array::{SpanTrait, ArrayTrait};
use option::OptionTrait;

use alexandria_ascii::interger::ToAsciiTrait;

use metadata::metadata::common::models::TokenData;
use metadata::metadata::common::models::String;
use metadata::metadata::common::utils::to_ascii;
use metadata::metadata::common::utils::ArrayConcat;

use metadata::metadata::slots::template::token::data;

use debug::PrintTrait;
// TODO: svgenerator?

fn debug_step() {
    let gas_now = testing::get_available_gas();
    gas::withdraw_gas().unwrap();
    gas_now.print();
}

fn generate(data: TokenData) -> Span<felt252> {
    'generating..'.print();

    let mut svg: Array<felt252> = Default::default();
    let cu_str: String = to_ascii(data.slot_data.project_data.projected_cu);
    let end_date_str: String = to_ascii(data.slot_data.project_data.end_year);
    let progress: u8 = data::get_progress(data);
    let progress_str: String = to_ascii(progress);
    let area_str: String = data::get_asset_area(data); // TODO
    let type_str: String = data.slot_data.project_data.type_; // TODO
    let mut sdgs: Span<felt252> = data.slot_data.project_data.sdgs; // TODO
    let sdg_count_str: String = to_ascii(sdgs.len());
    let status_str: String = data.slot_data.project_data.status; // TODO
    let name: String = data.slot_data.project_data.name;
    let country: String = data.slot_data.project_data.country;
    let developer: String = data.slot_data.project_data.developer;
    let certifier: String = data.slot_data.project_data.certifier;

    svg_header(ref svg);
    svg_styles(ref svg);
    svg_bg_filters(ref svg);
    svg_panel_text(cu_str, end_date_str, progress_str, ref svg);
    svg_lower_text(area_str, type_str, sdg_count_str, ref svg);
    svg_progress_bar(progress, ref svg);
    svg_sdgs(ref sdgs, ref svg);
    svg_status_group(status_str, ref svg);
    svg_main_text(name, country, developer, certifier, ref svg);
    svg_certifier_logo(0, ref svg);
    svg_background(ref svg);
    svg_def_patterns(ref svg);
    svg_def_filters(ref svg);
    svg_background_image(0, ref svg);
    svg_end(ref svg);

    svg.span()
}

fn svg_header(ref data: Array<felt252>) {
    data.append('<svg xmlns=\\"http://www.w3.org');
    data.append('/2000/svg\\" fill=\\"none\\" vi');
    data.append('ewBox=\\"0 0 316 360\\">');
}

fn svg_styles(ref data: Array<felt252>) {
    // TODO: add colors

    data.append('<style> @import url(\\"https://');
    data.append('fonts.googleapis.com/css2?famil');
    data.append('y=Inter:wght@400;500;600;700&di');
    data.append('splay=swap\\"); ');
    data.append('svg text { -webkit-user-select:');
    data.append(' none; -moz-user-select: none; ');
    data.append('-ms-user-select: none; user-sel');
    data.append('ect: none; -webkit-tap-highligh');
    data.append('t-color: rgba(255, 255, 255, 0)');
    data.append('; } </style>');
}

fn svg_bg_filters(ref data: Array<felt252>) {
    data.append('<g filter=\\"url(#a)\\" clip-pa');
    data.append('th=\\"url(#b)\\"><rect width=\\');
    data.append('"308\\" height=\\"353\\" fill=');
    data.append('\\"url(#c)\\" rx=\\"8\\" transf');
    data.append('orm=\\"matrix(-1 0 0 1 312 3)\\');
    data.append('"/><rect width=\\"308\\" height');
    data.append('=\\"353\\" fill=\\"url(#d)\\" r');
    data.append('x=\\"8\\" transform=\\"matrix(-');
    data.append('1 0 0 1 312 3)\\"/><g filter=\\');
    data.append('"url(#e)\\"><rect width=\\"292');
    data.append('\\" height=\\"55\\" x=\\"12\\" ');
    data.append('y=\\"231\\" fill=\\"#0D0D0D\\" ');
    data.append('fill-opacity=\\".6\\" rx=\\"8\\');
    data.append('" shape-rendering=\\"crispEdges');
    data.append('\\"/>');
}


//
// Dynamic Text
//
fn svg_panel_text(cu: String, end_date: String, progress: String, ref data: Array<felt252>) {
    data.append('<g font-family=\\"Inter\\" xml:');
    data.append('space=\\"preserve\\" style=\\"w');
    data.append('hite-space: pre\\"><text fill=');
    data.append('\\"#D0D1D6\\" fill-opacity=\\"0');
    data.append('.8\\" font-size=\\"11\\" font-w');
    data.append('eight=\\"500\\" letter-spacing=');
    data.append('\\"0em\\"><tspan x=\\"28\\" y=');
    data.append('\\"252.5\\">Carbon units</tspan');
    data.append('></text><text fill=\\"#EBECF0\\');
    data.append('" font-size=\\"14\\" font-weigh');
    data.append('t=\\"bold\\" letter-spacing=\\"');
    data.append('0em\\"><tspan x=\\"28\\" y=\\"2');
    data.append('72.091\\">');

    data.concat(cu);
    data.append(' Tons</tspan></tex');
    data.append('t><text fill=\\"#D0D1D6\\" fill');
    data.append('-opacity=\\"0.8\\" font-size=\\');
    data.append('"11\\" font-weight=\\"500\\" le');
    data.append('tter-spacing=\\"0em\\"><tspan x');
    data.append('=\\"117.5\\" y=\\"252.5\\">Ends');
    data.append(' in</tspan></text><text fill=\\');
    data.append('"#EBECF0\\" font-size=\\"14\\" ');
    data.append('font-weight=\\"bold\\" letter-s');
    data.append('pacing=\\"0em\\"><tspan x=\\"11');
    data.append('7.5\\" y=\\"272.091\\">');

    data.concat(end_date);
    data.append('</ts');
    data.append('pan></text><text fill=\\"#EFECE');
    data.append('A\\" font-size=\\"14\\" font-we');
    data.append('ight=\\"600\\" letter-spacing=');
    data.append('\\"0em\\"><tspan x=\\"257\\" y=');
    data.append('\\"256.091\\">');

    data.concat(progress);
    data.append('%</tspan></text></g>');
}

fn svg_lower_text(
    asset_area: String, project_type: String, sdg_count: String, ref data: Array<felt252>
) {
    data.append('<g xml:space=\\"preserve\\" sty');
    data.append('le=\\"white-space: pre\\" font-');
    data.append('family=\\"Inter\\"><text fill=');
    data.append('\\"#D0D1D6\\" fill-opacity=\\"0');
    data.append('.8\\" font-size=\\"10\\" font-w');
    data.append('eight=\\"500\\" letter-spacing=');
    data.append('\\"0em\\"><tspan x=\\"24\\" y=');
    data.append('\\"315.636\\">Surface</tspan></');
    data.append('text><text fill=\\"#EBECF0\\" f');
    data.append('ont-size=\\"14\\" font-weight=');
    data.append('\\"bold\\" letter-spacing=\\"0e');
    data.append('m\\"><tspan x=\\"24\\" y=\\"333');
    data.append('.091\\">');

    data.concat(asset_area); // 250
    data.append('m</tspan></text><tex');
    data.append('t fill=\\"#EBECF0\\" font-size=');
    data.append('\\"14\\" font-weight=\\"bold\\"');
    data.append(' letter-spacing=\\"0em\\"><tspa');
    data.append('n x=\\"64.25\\" y=\\"333.091\\"');
    data.append('>&#xb2;</tspan></text><text fil');
    data.append('l=\\"#D0D1D6\\" fill-opacity=\\');
    data.append('"0.8\\" font-size=\\"10\\" font');
    data.append('-weight=\\"500\\" letter-spacin');
    data.append('g=\\"0em\\"><tspan x=\\"117\\" ');
    data.append('y=\\"315.636\\">Type</tspan></t');
    data.append('ext><text fill=\\"#EFECEA\\" fo');
    data.append('nt-size=\\"14\\" font-weight=\\');
    data.append('"bold\\" letter-spacing=\\"0em');
    data.append('\\"><tspan x=\\"117\\" y=\\"333');
    data.append('.091\\">');

    data.concat(project_type); // ARR';
    data.append('</tspan></text><text');
    data.append(' fill=\\"#D0D1D6\\" fill-opacit');
    data.append('y=\\"0.8\\" font-size=\\"10\\" ');
    data.append('font-weight=\\"500\\"><tspan x=');
    data.append('\\"186\\" y=\\"315.636\\">Impac');
    data.append('t on </tspan></text><text fill=');
    data.append('\\"#EFECEA\\" font-size=\\"14\\');
    data.append('" font-weight=\\"bold\\"><tspan');
    data.append(' x=\\"181\\" y=\\"333.091\\">');

    data.concat(sdg_count); // 3
    data.append('SDG&#x2019;s</tspan></text></g>');
}

// Progress bar
fn svg_progress_bar(progress: u8, ref data: Array<felt252>) {
    // TODO: get progress + colors
    data.append('<path stroke=\\"url(#f)\\" stro');
    data.append('ke-linecap=\\"round\\" stroke-o');
    data.append('pacity=\\".3\\" stroke-width=\\');
    data.append('"8\\" d=\\"M179 269h106\\"/><pa');
    data.append('th stroke=\\"url(#g)\\" stroke-');
    data.append('linecap=\\"round\\" stroke-opac');
    data.append('ity=\\".8\\" stroke-width=\\"4');
    data.append('\\" d=\\"M180 269h64\\"/><rect ');
    data.append('width=\\"291\\" height=\\"54\\"');
    data.append(' x=\\"12.5\\" y=\\"231.5\\" str');
    data.append('oke=\\"#D0D1D6\\" stroke-opacit');
    data.append('y=\\".2\\" rx=\\"7.5\\" shape-r');
    data.append('endering=\\"crispEdges\\"/></g>');
}

// SDGs images
fn svg_sdgs(ref sdgs: Span<felt252>, ref data: Array<felt252>) {
    loop {
        match sdgs.pop_front() {
            Option::Some(sdg) => {
                svg_sdg(*sdg, ref data);
            },
            Option::None => {
                break;
            },
        };
    };
}

fn svg_sdg(sdg: felt252, ref data: Array<felt252>) {
    // TODO: dynamize
    data.append('<rect width=\\"30\\" height=\\"');
    data.append('30\\" x=\\"246\\" y=\\"306\\" f');
    data.append('ill=\\"#272727\\" rx=\\"2\\"/>');
    svg_sdg(0, ref data);

    data.append('<defs><clipPath id=\\"SDG13-cli');
    data.append('p\\"><rect width=\\"30\\" heigh');
    data.append('t=\\"30\\" x=\\"246\\" y=\\"306');
    data.append('\\" rx=\\"2\\"/></clipPath></de');
    data.append('fs><g fill=\\"url(#h)\\" fill-o');
    data.append('pacity=\\".6\\" rx=\\"2\\" clip');
    data.append('-path=\\"url(#SDG13-clip)\\"><s');
    data.append('vg id=\\"SDG13\\" xmlns=\\"http');
    data.append('://www.w3.org/2000/svg\\" viewB');
    data.append('ox=\\"0 0 62.11 62.11\\" width=');
    data.append('\\"30\\" height=\\"30\\" x=\\"2');
    data.append('46\\" y=\\"306\\">');

    data.append('</g><rect width=\\"30\\" h');
    data.append('eight=\\"30\\" x=\\"254\\" y=\\');
    data.append('"306\\" fill=\\"#272727\\" rx=');
    data.append('\\"2\\"/><rect width=\\"30\\" h');
    data.append('eight=\\"30\\" x=\\"254\\" y=\\');
    data.append('"306\\" fill=\\"url(#i)\\" fill');
    data.append('-opacity=\\".6\\" rx=\\"2\\"/><');
    data.append('rect width=\\"30\\" height=\\"3');
    data.append('0\\" x=\\"262\\" y=\\"306\\" fi');
    data.append('ll=\\"#272727\\" rx=\\"2\\"/><r');
    data.append('ect width=\\"30\\" height=\\"30');
    data.append('\\" x=\\"262\\" y=\\"306\\" fil');
    data.append('l=\\"url(#j)\\" fill-opacity=\\');
    data.append('".6\\" rx=\\"2\\"/></g>');
}


// Live group
fn svg_status_group(status: String, ref data: Array<felt252>) {
    // TODO: dynamize 

    data.append('<g filter=\\"url(#k)\\"><rect x');
    data.append('=\\"246\\" y=\\"20\\" width=\\"');
    data.append('50\\" height=\\"22\\" rx=\\"11');
    data.append('\\" fill=\\"#1F2128\\" fill-opa');
    data.append('city=\\"0.2\\"/><circle cx=\\"2');
    data.append('56\\" cy=\\"31\\" r=\\"3\\" fil');
    data.append('l=\\"#09E1A1\\"/><text fill=\\"');
    data.append('#0AF2AD\\" xml:space=\\"preserv');
    data.append('e\\" style=\\"white-space: pre');
    data.append('\\" font-family=\\"Inter\\" fon');
    data.append('t-size=\\"12\\" font-weight=\\"');
    data.append('500\\"><tspan x=\\"264.311\\" y');
    data.append('=\\"35.3636\\">');

    data.concat(status);
    data.append('</tspan></te');
    data.append('xt><rect x=\\"246.5\\" y=\\"20.');
    data.append('5\\" width=\\"49\\" height=\\"2');
    data.append('1\\" rx=\\"10.5\\" stroke=\\"#A');
    data.append('BEFC6\\" stroke-opacity=\\"0.3');
    data.append('\\"/></g>');
}

// Main text
fn svg_main_text(
    name: String, country: String, developer: String, certifier: String, ref data: Array<felt252>
) {
    data.append('<g xml:space=\\"preserve\\" sty');
    data.append('le=\\"white-space: pre\\" font-');
    data.append('family=\\"Inter\\"><text fill=');
    data.append('\\"#EFECEA\\" font-family=\\"In');
    data.append('ter\\" font-size=\\"21\\" font-');
    data.append('weight=\\"700\\" line-height=\\');
    data.append('"21\\" letter-spacing=\\"-0.03e');
    data.append('m\\" text-align=\\"left\\"><tsp');
    data.append('an x=\\"20\\" y=\\"176.136\\">');

    data.concat(name); // 'Banegas Farm'
    data.append('</tspan></text><text');
    data.append(' fill=\\"#D0D1D6\\" fill-opacit');
    data.append('y=\\"0.8\\" font-size=\\"10\\">');
    data.append('<tspan x=\\"20.1074\\" y=\\"195');
    data.append('.636\\">Based in </tspan></text');
    data.append('><text fill=\\"#D0D1D6\\" font-');
    data.append('size=\\"10\\" font-weight=\\"60');
    data.append('0\\"><tspan x=\\"63.3496\\" y=');
    data.append('\\"195.636\\">');

    data.concat(country); // 'Costa Rica'
    data.append('</tspan');
    data.append('></text><text fill=\\"#D0D1D6\\');
    data.append('" fill-opacity=\\"0.8\\" font-s');
    data.append('ize=\\"10\\" letter-spacing=\\"');
    data.append('0em\\"><tspan x=\\"20\\" y=\\"2');
    data.append('09.636\\">By </tspan></text><te');
    data.append('xt fill=\\"#D0D1D6\\" font-size');
    data.append('=\\"10\\" font-weight=\\"600\\"');
    data.append(' letter-spacing=\\"0em\\"><tspa');
    data.append('n x=\\"34.8828\\" y=\\"209.636');
    data.append('\\">');

    data.concat(developer); // 'Corcovado Foundation';
    data.append('</tspan');
    data.append('></text><text fill=\\"#D0D1D6\\');
    data.append('" fill-opacity=\\"0.8\\" font-s');
    data.append('ize=\\"10\\" letter-spacing=\\"');
    data.append('0em\\"><tspan x=\\"204\\" y=\\"');
    data.append('195.636\\">Certified by</tspan>');
    data.append('</text><text fill=\\"#EFECEA\\"');
    data.append(' font-size=\\"11\\" font-weight');
    data.append('=\\"600\\" letter-spacing=\\"0e');
    data.append('m\\"><tspan x=\\"239\\" y=\\"20');
    data.append('9.5\\">');

    data.concat(certifier); // 'ERS';
    data.append('</tspan></text></g>');
}

// ERS logo ?
fn svg_certifier_logo(component_id: felt252, ref data: Array<felt252>) {
    data.append('<rect width=\\"28\\" height=\\"');
    data.append('28\\" x=\\"268\\" y=\\"185\\" f');
    data.append('ill=\\"#EBECF0\\" fill-opacity=');
    data.append('\\".1\\" rx=\\"14\\"/><svg widt');
    data.append('h=\\"14\\" height=\\"14\\" x=\\');
    data.append('"275\\" y=\\"192\\" viewBox=\\"');
    data.append('0 0 51 61\\"><g opacity=\\"0.6');
    data.append('\\" style=\\"mix-blend-mode:scr');
    data.append('een\\"><path d=\\"M18.0435 41.8');
    data.append('89L16.1607 46.8835H1.8828L0 60.');
    data.append('7391H13.6503L15.2977 56.228C16.');
    data.append('0822 54.1335 18.1219 52.6835 20');
    data.append('.3185 52.6835H43.7751L45.6579 3');
    data.append('8.8279H22.3582C20.4754 38.9085 ');
    data.append('18.7495 40.1168 18.0435 41.889Z');
    data.append('\\" fill=\\"#F5F5F5\\"/><path d');
    data.append('=\\"M17.965 36.814C18.7495 34.7');
    data.append('196 20.7892 33.2696 22.9858 33.');
    data.append('2696H38.5189L40.4017 19.414H24.');
    data.append('9471C23.0643 19.414 21.3384 20.');
    data.append('6223 20.7108 22.3945L18.828 27.');
    data.append('4695H4.5501L2.6673 41.3251H16.3');
    data.append('176L17.965 36.814Z\\" fill=\\"#');
    data.append('F5F5F5\\"/><path d=\\"M23.2212 ');
    data.append('2.98057L21.3384 8.05558H7.0605L');
    data.append('5.1777 21.8306H18.828L20.4754 1');
    data.append('7.3195C21.2599 15.2251 23.2996 ');
    data.append('13.775 25.4962 13.775H48.9528L5');
    data.append('0.8356 0H27.4575C25.5747 0 23.9');
    data.append('272 1.20834 23.2212 2.98057Z\\"');
    data.append(' fill=\\"#F5F5F5\\"/></g></svg>');
    data.append('<rect width=\\"27\\" height=\\"');
    data.append('27\\" x=\\"268.5\\" y=\\"185.5');
    data.append('\\" stroke=\\"#EBECF0\\" stroke');
    data.append('-dasharray=\\"3 3\\" stroke-lin');
    data.append('ecap=\\"round\\" stroke-miterli');
    data.append('mit=\\"1.23\\" stroke-opacity=');
    data.append('\\".7\\" rx=\\"13.5\\"/>');
}

fn svg_background(ref data: Array<felt252>) {
    data.append('<rect width=\\"312\\" height=\\');
    data.append('"356\\" x=\\"2\\" y=\\"2\\" str');
    data.append('oke=\\"url(#m)\\" stroke-linejo');
    data.append('in=\\"round\\" stroke-opacity=');
    data.append('\\".8\\" stroke-width=\\"4\\" r');
    data.append('x=\\"14\\"/>');
}

// Defs:
fn svg_def_patterns(ref data: Array<felt252>) {
    // TODO: check if need dynamization (progress bar)
    data.append('<defs><pattern id=\\"c\\" width');
    data.append('=\\"1\\" height=\\"1\\" pattern');
    data.append('ContentUnits=\\"objectBoundingB');
    data.append('ox\\"><use href=\\"#n\\" transf');
    data.append('orm=\\"matrix(.00258 0 0 .00225');
    data.append(' -.37 0)\\"/></pattern><pattern');
    data.append(' id=\\"h\\" width=\\"1\\" heigh');
    data.append('t=\\"1\\" patternContentUnits=');
    data.append('\\"objectBoundingBox\\"><use hr');
    data.append('ef=\\"#o\\" transform=\\"scale(');
    data.append('.00098)\\"/></pattern><pattern ');
    data.append('id=\\"i\\" width=\\"1\\" height');
    data.append('=\\"1\\" patternContentUnits=\\');
    data.append('"objectBoundingBox\\"><use href');
    data.append('=\\"#p\\" transform=\\"scale(.0');
    data.append('0065)\\"/></pattern><pattern id');
    data.append('=\\"j\\" width=\\"1\\" height=');
    data.append('\\"1\\" patternContentUnits=\\"');
    data.append('objectBoundingBox\\"><use href=');
    data.append('\\"#q\\" transform=\\"scale(.00');
    data.append('065)\\"/></pattern><pattern id=');
    data.append('\\"l\\" width=\\"1\\" height=\\');
    data.append('"1\\" patternContentUnits=\\"ob');
    data.append('jectBoundingBox\\"><use href=\\');
    data.append('"#r\\" transform=\\"translate(.');
    data.append('08) scale(.0032)\\"/></pattern>');
}

// filters
fn svg_def_filters(ref data: Array<felt252>) {
    // TODO: check if need dynamization (progress bar)
    data.append('<linearGradient id=\\"d\\" x1=');
    data.append('\\"153.74\\" x2=\\"154.71\\" y1');
    data.append('=\\"116.5\\" y2=\\"353\\" gradi');
    data.append('entUnits=\\"userSpaceOnUse\\"><');
    data.append('stop stop-color=\\"#0B0D13\\" s');
    data.append('top-opacity=\\".4\\"/><stop off');
    data.append('set=\\"1\\" stop-color=\\"#0B0D');
    data.append('13\\" stop-opacity=\\".9\\"/></');
    data.append('linearGradient><linearGradient ');
    data.append('id=\\"f\\" x1=\\"285\\" x2=\\"1');
    data.append('79\\" y1=\\"270\\" y2=\\"270\\"');
    data.append(' gradientUnits=\\"userSpaceOnUs');
    data.append('e\\"><stop offset=\\".4\\" stop');
    data.append('-color=\\"#A8C4EF\\"/><stop off');
    data.append('set=\\"1\\" stop-color=\\"#0AF2');
    data.append('AD\\"/></linearGradient><linear');
    data.append('Gradient id=\\"g\\" x1=\\"244\\');
    data.append('" x2=\\"180\\" y1=\\"270\\" y2=');
    data.append('\\"270\\" gradientUnits=\\"user');
    data.append('SpaceOnUse\\"><stop offset=\\".');
    data.append('4\\" stop-color=\\"#A8C4EF\\"/>');
    data.append('<stop offset=\\"1\\" stop-color');
    data.append('=\\"#0AF2AD\\"/></linearGradien');
    data.append('t><filter id=\\"a\\" width=\\"3');
    data.append('10\\" height=\\"354\\" x=\\"3\\');
    data.append('" y=\\"3\\" color-interpolation');
    data.append('-filters=\\"sRGB\\" filterUnits');
    data.append('=\\"userSpaceOnUse\\"><feFlood ');
    data.append('flood-opacity=\\"0\\" result=\\');
    data.append('"BackgroundImageFix\\"/><feColo');
    data.append('rMatrix in=\\"SourceAlpha\\" re');
    data.append('sult=\\"hardAlpha\\" values=\\"');
    data.append('0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0');
    data.append(' 0 0 127 0\\"/><feMorphology in');
    data.append('=\\"SourceAlpha\\" operator=\\"');
    data.append('dilate\\" radius=\\"1\\" result');
    data.append('=\\"effect1_dropShadow_2951_192');
    data.append('338\\"/><feOffset /><feColorMat');
    data.append('rix values=\\"0 0 0 0 0.321569 ');
    data.append('0 0 0 0 0.337255 0 0 0 0 0.3803');
    data.append('92 0 0 0 0.4 0\\"/><feBlend in2');
    data.append('=\\"BackgroundImageFix\\" resul');
    data.append('t=\\"effect1_dropShadow_2951_19');
    data.append('2338\\"/><feBlend in=\\"SourceG');
    data.append('raphic\\" in2=\\"effect1_dropSh');
    data.append('adow_2951_192338\\" result=\\"s');
    data.append('hape\\"/></filter><filter id=\\');
    data.append('"e\\" width=\\"304\\" height=\\');
    data.append('"69\\" x=\\"6\\" y=\\"231\\" co');
    data.append('lor-interpolation-filters=\\"sR');
    data.append('GB\\" filterUnits=\\"userSpaceO');
    data.append('nUse\\"><feFlood flood-opacity=');
    data.append('\\"0\\" result=\\"BackgroundIma');
    data.append('geFix\\"/><feColorMatrix in=\\"');
    data.append('SourceAlpha\\" result=\\"hardAl');
    data.append('pha\\" values=\\"0 0 0 0 0 0 0 ');
    data.append('0 0 0 0 0 0 0 0 0 0 0 127 0\\"/');
    data.append('><feOffset dy=\\"8\\"/><feGauss');
    data.append('ianBlur stdDeviation=\\"3\\"/><');
    data.append('feComposite in2=\\"hardAlpha\\"');
    data.append(' operator=\\"out\\"/><feColorMa');
    data.append('trix values=\\"0 0 0 0 0 0 0 0 ');
    data.append('0 0 0 0 0 0 0 0 0 0 0.05 0\\"/>');
    data.append('<feBlend in2=\\"BackgroundImage');
    data.append('Fix\\" result=\\"effect1_dropSh');
    data.append('adow_2951_192338\\"/><feBlend i');
    data.append('n=\\"SourceGraphic\\" in2=\\"ef');
    data.append('fect1_dropShadow_2951_192338\\"');
    data.append(' result=\\"shape\\"/><feColorMa');
    data.append('trix in=\\"SourceAlpha\\" resul');
    data.append('t=\\"hardAlpha\\" values=\\"0 0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('0 127 0\\"/><feOffset dy=\\"2\\');
    data.append('"/><feGaussianBlur stdDeviation');
    data.append('=\\"4\\"/><feComposite in2=\\"h');
    data.append('ardAlpha\\" k2=\\"-1\\" k3=\\"1');
    data.append('\\" operator=\\"arithmetic\\"/>');
    data.append('<feColorMatrix values=\\"0 0 0 ');
    data.append('0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0');
    data.append('.25 0\\"/><feBlend in2=\\"shape');
    data.append('\\" result=\\"effect2_innerShad');
    data.append('ow_2951_192338\\"/></filter><fi');
    data.append('lter id=\\"k\\" width=\\"90\\" ');
    data.append('height=\\"62\\" x=\\"226\\" y=');
    data.append('\\"0\\" color-interpolation-fil');
    data.append('ters=\\"sRGB\\" filterUnits=\\"');
    data.append('userSpaceOnUse\\"><feFlood floo');
    data.append('d-opacity=\\"0\\" result=\\"Bac');
    data.append('kgroundImageFix\\"/><feGaussian');
    data.append('Blur in=\\"BackgroundImageFix\\');
    data.append('" stdDeviation=\\"10\\"/><feCom');
    data.append('posite in2=\\"SourceAlpha\\" op');
    data.append('erator=\\"in\\" result=\\"effec');
    data.append('t1_backgroundBlur_2951_192338\\');
    data.append('"/><feBlend in=\\"SourceGraphic');
    data.append('\\" in2=\\"effect1_backgroundBl');
    data.append('ur_2951_192338\\" result=\\"sha');
    data.append('pe\\"/></filter><radialGradient');
    data.append(' id=\\"m\\" cx=\\"0\\" cy=\\"0');
    data.append('\\" r=\\"1\\" gradientTransform');
    data.append('=\\"matrix(277.26244 -278.9438 ');
    data.append('986.71036 980.76284 101.47 200.');
    data.append('29)\\" gradientUnits=\\"userSpa');
    data.append('ceOnUse\\"><stop offset=\\".02');
    data.append('\\" stop-color=\\"#E8E7E7\\"/><');
    data.append('stop offset=\\".06\\" stop-colo');
    data.append('r=\\"#BAD3CB\\"/><stop offset=');
    data.append('\\".38\\" stop-color=\\"#0AF2AD');
    data.append('\\"/><stop offset=\\".4\\" stop');
    data.append('-color=\\"#27EABA\\"/><stop off');
    data.append('set=\\".56\\" stop-color=\\"#C3');
    data.append('C2FF\\"/><stop offset=\\".75\\"');
    data.append(' stop-color=\\"#FFFCFC\\"/><sto');
    data.append('p offset=\\".88\\" stop-color=');
    data.append('\\"#E8E3E3\\"/><stop offset=\\"');
    data.append('1\\" stop-color=\\"#B3B3B3\\"/>');
    data.append('</radialGradient><clipPath id=');
    data.append('\\"b\\"><rect width=\\"308\\" h');
    data.append('eight=\\"352\\" x=\\"4\\" y=\\"');
    data.append('4\\" fill=\\"#fff\\" rx=\\"12\\');
    data.append('"/></clipPath>');
}

// + b64 JPEG images
fn svg_background_image(comp_id: felt252, ref data: Array<felt252>) {
    data.append('<image id=\\"image0\\" width=\\');
    data.append('"673\\" height=\\"444\\" xlink:');
    data.append('href=\\"data:image/jpeg;base64,');
// TODO: get from provider Insert background image from provider here
}

fn svg_end(ref data: Array<felt252>) {
    data.append('</defs></svg>');
}
