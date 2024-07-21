use metadata::metadata::common::data as common_data;
use metadata::metadata::common::models::{
    ProjectStaticData, String, Shortstring, ProjectStatus, AssetSize, ToString
};
use metadata::metadata::common::utils::{ToSpanOption, ArrayConcat};
use metadata::interfaces::component::IComponentDispatcherTrait;
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::components::configs::svg;
use metadata::components::component::sft;
use metadata::metadata::vintages::models::{
    CPV3TemplateData as TemplateData, CPV3StorageData as StorageData
};
use alexandria_ascii::ToAsciiTrait;

impl DefaultSpan<T, impl D: Default<T>, impl D: Drop<T>> of Default<Span<T>> {
    fn default() -> Span<T> {
        array![].span()
    }
}


#[inline(always)]
fn generate_data(static: ProjectStaticData, storage: StorageData) -> TemplateData {
    // Reusing the token template
    let project_name: String = static.name;
    let project_description: String = static.description;
    let empty = array![''].span();
    let vintage = storage.vintage;

    TemplateData {
        external_url: static.external_url,
        youtube_url: common_data::get_youtube_url(),
        project: static,
        project_area: array![static.area.to_ascii()].span(),
        project_carbon_units: array![static.total_cu.to_ascii()].span(),
        project_name,
        project_description,
        vintage_year: array![vintage.year.to_ascii()].span(),
        vintage_supply: array![vintage.supply.to_ascii()].span(),
        vintage_supply_fmt: format_capacity_(vintage.supply.into()),
        vintage_failed: array![vintage.failed.to_ascii()].span(),
        vintage_type: array![vintage.status.into()].span(),
        asset_carbon_units: format_capacity_(static.total_cu.into()),
        sdg_components: generate_sdgs_rows_(storage, static.sdgs),
        sdg_count: array![static.sdgs.len().to_ascii()].span(),
        background_image: get_background_image_(storage, static),
        status_component: generate_status_(storage, static),
        border_component: generate_border_(storage, AssetSize::S),
    }
}


//
// Template components constants
//

const STATUS_COMP_ID: felt252 = 'SFT.Status.svg';
const BORDER_COMP_ID: felt252 = 'SFT.Border.v2.svg';


//
// Status generation
//

#[inline(always)]
fn get_status_props_(status: ProjectStatus) -> sft::status::Properties {
    let mut props: sft::status::Properties = Default::default();
    let (status_str, r1_width, c_fill, c_opacity, t_fill, r2_stroke, r2_stroke_opacity) =
        match status {
        ProjectStatus::Upcoming => (
            array!['Upcoming'].span(), 85, '#8CA5FF', '.9', '#97ACFA', '#8994F5', '.3'
        ),
        ProjectStatus::Live => (
            array!['Live'].span(), 50, '#09E1A1', '1', '#0AF2AD', '#ABEFC6', '.3'
        ),
        ProjectStatus::Paused => (
            array!['Paused'].span(), 69, '#F7640E', '.7', '#EA8C55', '#D2540B', '.3'
        ),
        ProjectStatus::Stopped => (
            array!['Stopped'].span(), 75, '#F93743', '.7', '#FF6868', '#F93743', '.3'
        ),
        ProjectStatus::Ended => (
            array!['Ended'].span(), 63, '#D0D1D6', '.7', '#D0D1D6', '#D0D1D6', '.2'
        ),
    };

    sft::status::Properties {
        x: Option::Some(316 - r1_width - 20),
        y: Option::Some(20),
        status: status_str,
        r1_width: r1_width,
        c_fill: c_fill,
        c_opacity: c_opacity,
        t_fill: t_fill,
        r2_stroke: r2_stroke,
        r2_stroke_opacity: r2_stroke_opacity,
    }
}

#[inline(always)]
fn generate_status_(storage: StorageData, static: ProjectStaticData) -> String {
    let mut data: Array<felt252> = Default::default();
    let status = get_status_(storage, static);
    let props = get_status_props_(status);

    data.append('<defs><clipPath id=\\"status_bl');
    data.append('ur_clip\\"><rect width=\\"');
    data.append((props.r1_width - 2).to_ascii());
    data.append('\\"');
    data.append(' height=\\"20\\"');
    match props.x {
        Option::Some(x) => {
            data.append(' x=\\"');
            data.append((x + 1).to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
    match props.y {
        Option::Some(y) => {
            data.append(' y=\\"');
            data.append((y + 1).to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
    data.append(' rx=\\"10\\" fill=\\"wh');
    data.append('ite\\"/></clipPath><filter id=');
    data.append('\\"status_blur\\"');
    match props.x {
        Option::Some(x) => {
            data.append(' x=\\"');
            data.append((x - 1).to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }

    match props.y {
        Option::Some(y) => {
            data.append(' y=\\"');
            data.append((y - 1).to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
    data.append(' width=\\"125\\" height=\\"62\\"');
    data.append(' color-interpolation-');
    data.append('filters=\\"sRGB\\" filterUnits=');
    data.append('\\"userSpaceOnUse\\"><feGaussia');
    data.append('nBlur in=\\"SourceGraphic\\" st');
    data.append('dDeviation=\\"10\\" result=\\"bl');
    data.append('ur\\"/><feBlend in2=\\"blur\\"/');
    data.append('></filter></defs><g filter=\\"u');
    data.append('rl(#status_blur)\\" clip-path=');
    data.append('\\"url(#status_blur_clip)\\"><g');
    data.append(' filter=\\"url(#filter0_d)\\" c');
    data.append('lip-path=\\"url(#clip0)\\"><g');
    data.append(' transf');
    data.append('orm=\\"matrix(-1 0 0 1 312 3)\\');
    data.append('"><rect width=\\"308\\" height=');
    data.append('\\"353\\" rx=\\"8\\" fill=\\"ur');
    data.append('l(#pattern0)\\"/><rect width=\\');
    data.append('"308\\" height=\\"353\\" rx=\\"');
    data.append('8\\" fill=\\"url(#paint0_linear');
    data.append(')\\"/></g></g></g>');

    let mut args: Array<felt252> = Default::default();
    props.serialize(ref args);
    let image = get_component_instance(
        storage.component_provider, STATUS_COMP_ID, Option::Some(args.span())
    );

    data.concat(image);

    data.span()
}

const SECONDS_IN_YEAR: u64 = 31557600;

#[inline(always)]
fn get_status_(storage: StorageData, static: ProjectStaticData) -> ProjectStatus {
    // TODO use timestamps
    let mut status: ProjectStatus = ProjectStatus::Live;
    if static.paused == 1 {
        status = ProjectStatus::Paused;
    } else if 1970 + storage.timestamp / SECONDS_IN_YEAR < storage.start_year.into() {
        status = ProjectStatus::Upcoming;
    } else if 1970 + storage.timestamp / SECONDS_IN_YEAR < storage.end_year.into() {
        status = ProjectStatus::Live;
    } else if 1970 + storage.timestamp / SECONDS_IN_YEAR > storage.end_year.into() {
        status = ProjectStatus::Ended;
    }
    status
}

#[inline(always)]
fn get_component_instance(
    provider: IComponentProviderDispatcher, id: felt252, arg_props: Option<Span<felt252>>
) -> String {
    let component = provider.get(id);
    match component {
        Option::Some(c) => {
            c.render(arg_props).span()
        },
        Option::None => {
            array![].span()
        },
    }
}

//
// SDG Rows generation
//

// Constructs the string SDG_XX.svg
#[inline(always)]
fn get_sdg_component_id_(num: u8) -> felt252 {
    let mut id: felt252 = num.to_ascii() * 0x1_00_00_00_00 + '.svg';
    if num < 10 {
        id += 'SDG0' * 0x1_00_00000000;
    } else {
        id += 'SDG' * 0x1_0000_00000000;
    }
    id
}

#[inline(always)]
fn generate_sdg_(
    provider: IComponentProviderDispatcher, id: u8, num_sdgs: usize, index: usize
) -> String {
    // Draw at most 4 per row
    let mut data: Array<felt252> = Default::default();

    let n_rows = (num_sdgs + 3) / 4;
    let size: usize = 30 / n_rows;
    let mut dx: usize = 0;
    if n_rows > 1 {
        dx = (46 - size) / 4 + 1;
    } else if num_sdgs > 1 {
        dx = (46 - size) / (num_sdgs - 1) + 1;
    }

    let x = 246 + (dx * (index % 4));
    let y = 306 + (size * (index / 4));

    let size_str: felt252 = size.to_ascii();
    let x_str: felt252 = x.to_ascii();
    let y_str: felt252 = y.to_ascii();
    let index_str: felt252 = index.to_ascii();

    // Shadow
    data.append('<rect width=\\"');
    data.append(size_str);
    data.append('\\" height=\\"');
    data.append(size_str);
    data.append('\\" x=\\"');
    data.append(x_str);
    data.append('\\" y=\\"');
    data.append(y_str);
    data.append('\\" fill=\\"#272727\\" rx=\\"2\\"');

    // clip path and group
    data.append('/><defs>');
    data.append('<clipPath id=\\"clip-sdg-');
    data.append(index_str);
    data.append('\\"><rect width=\\"');
    data.append(size_str);
    data.append('\\" height=\\"');
    data.append(size_str);
    data.append('\\" x=\\"');
    data.append(x_str);
    data.append('\\" y=\\"');
    data.append(y_str);
    data.append('\\" rx=\\"2\\"/></clipPath></de');
    data.append('fs><g fill=\\"url(#h)\\" fill-o');
    data.append('pacity=\\".6\\" clip');
    data.append('-path=\\"url(#clip-sdg-');
    data.append(index_str);
    data.append(')\\">');

    let props: svg::Properties = svg::Properties {
        width: Option::Some(size),
        height: Option::Some(size),
        x: Option::Some(x),
        y: Option::Some(y),
    };

    let mut args: Array<felt252> = Default::default();
    props.serialize(ref args);
    let component_id = get_sdg_component_id_(id);
    let image = get_component_instance(provider, component_id, Option::Some(args.span()));

    data.concat(image);
    data.append('</g>');

    data.span()
}

fn generate_sdgs_rows_(storage: StorageData, sdgs: Span<u8>) -> String {
    let mut data: Array<felt252> = Default::default();
    let mut sdgs = sdgs;
    let size = sdgs.len();
    let mut i = 0;
    loop {
        match sdgs.pop_front() {
            Option::Some(sdg_num) => {
                let sdg_str = generate_sdg_(storage.component_provider, *sdg_num, size, i);
                data.concat(sdg_str);
            },
            Option::None => {
                break;
            },
        };
        i += 1;
    };
    data.span()
}

#[inline(always)]
fn format_capacity_(capacity: u256) -> String {
    // TODO: use decimals
    if capacity < 1_000 {
        let mut res = capacity.to_ascii();
        res.append('g');
        res.span()
    } else if capacity < 1_000_000 {
        let mut res = (capacity / 1_000).to_ascii();
        res.append('kg');
        res.span()
    } else if capacity < 1_000_000_000 {
        let mut res = (capacity / 1_000_000).to_ascii();
        res.append('t');
        res.span()
    } else if capacity < 1_000_000_000_000 {
        let mut res = (capacity / 1_000_000_000).to_ascii();
        res.append('kt');
        res.span()
    } else {
        let mut res = (capacity / 1_000_000_000_000).to_ascii();
        res.append('Mt');
        res.span()
    }
}

//
// Gamification Badge generation
// 

#[inline(always)]
fn generate_badge_(storage: StorageData, size: AssetSize) -> String {
    let x = 20;
    let y = 104;
    let props: svg::Properties = svg::Properties {
        width: Option::None, height: Option::None, x: Option::Some(x), y: Option::Some(y),
    };

    let mut args: Array<felt252> = Default::default();
    props.serialize(ref args);
    let badge_id = match size {
        AssetSize::XS => 'SFT.BadgeXS.svg',
        AssetSize::S => 'SFT.BadgeS.svg',
        AssetSize::M => 'SFT.BadgeM.svg',
        AssetSize::L => 'SFT.BadgeL.svg',
        AssetSize::XL => 'SFT.BadgeXL.svg',
        AssetSize::Infinite => 'SFT.BadgeInfty.svg',
    };
    let image = get_component_instance(
        storage.component_provider, badge_id, Option::Some(args.span())
    );

    image
}

//
// Border generation
// 
#[inline(always)]
fn get_border_props_(size: AssetSize) -> sft::border_v2::Properties {
    let (x1, x2, y1, y2, stops, stroke_opacity) = match size {
        AssetSize::XS => (
            '4', '312', '180', '180', array![('0', '#60EFFF'), ('1', '#00FF87')].span(), '0.5'
        ),
        AssetSize::S => (
            '4', '312', '180', '180', array![('0', '#FFEDBC'), ('1', '#ED4264')].span(), '0.6'
        ),
        AssetSize::M => (
            '4', '312', '180', '180', array![('0', '#AB4883'), ('1', '#8785FF')].span(), '0.7'
        ),
        AssetSize::L => (
            '61.5',
            '234.5',
            '4',
            '356',
            array![
                ('.08', '#DEB69C'),
                ('.19', '#55372C'),
                ('.4', '#FFECE0'),
                ('.51', '#F0CAB2'),
                ('.57', '#775C50'),
                ('.62', '#55372C'),
                ('.79', '#7A5843'),
                ('.91', '#F0CAB2'),
                ('1', '#FFECE0'),
            ]
                .span(),
            '0.86'
        ),
        AssetSize::XL => (
            '40',
            '252',
            '15.5',
            '356',
            array![
                ('.07', '#FBFBFD'),
                ('.24', '#C8D4DA'),
                ('.43', '#fff'),
                ('.53', '#9EB9CD'),
                ('.66', '#E3E9EE'),
                ('.71', '#FAFBFC'),
                ('.75', '#9EB9CD'),
                ('.86', '#D6DFE6'),
                ('.92', '#A7C1D0'),
            ]
                .span(),
            '0.9'
        ),
        AssetSize::Infinite => (
            '71.5',
            '209',
            '4',
            '361',
            array![
                ('.07', '#E1B950'),
                ('.24', '#F6F3A6'),
                ('.43', '#F6F3A6'),
                ('.49', '#EDCC7D'),
                ('.53', '#E1B950'),
                ('.59', '#675102'),
                ('.63', '#675102'),
                ('.71', '#EDCC7D'),
                ('.77', '#E1B950'),
                ('.92', '#675102'),
            ]
                .span(),
            '0.8'
        ),
    };

    sft::border_v2::Properties {
        x: Option::None, y: Option::None, x1, x2, y1, y2, stroke_opacity, stops
    }
}

#[inline(always)]
fn generate_border_(storage: StorageData, size: AssetSize) -> String {
    let mut args: Array<felt252> = Default::default();
    let props = get_border_props_(size);
    props.serialize(ref args);
    let image = get_component_instance(
        storage.component_provider, BORDER_COMP_ID, Option::Some(args.span())
    );

    image
}

// Background Image
#[inline(always)]
fn get_background_image_(storage: StorageData, static: ProjectStaticData) -> String {
    let args: Option<Span<felt252>> = Option::None;
    let image = get_component_instance(
        storage.component_provider, static.background_component, args
    );

    image
}
