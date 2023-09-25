use metadata::metadata::common::data as common_data;
use metadata::metadata::common::models::{
    StorageData, ProjectStaticData, String, Shortstring, ProjectStatus, AssetSize, ToString
};
use metadata::metadata::common::utils::{ToSpanOption, ArrayConcat};
use metadata::interfaces::component::IComponentDispatcherTrait;
use metadata::interfaces::component_provider::IComponentProviderDispatcherTrait;
use metadata::components::configs::svg;
use metadata::components::component::sft;

use alexandria_ascii::ToAsciiTrait;

//
// Template components constants
//

const PROGRESS_BAR_COMP_ID: felt252 = 'SFT.ProgressBar.svg';
const STATUS_COMP_ID: felt252 = 'SFT.Status.svg';
const BADGE_COMP_ID: felt252 = 'SFT.Badge.svg';
const BORDER_COMP_ID: felt252 = 'SFT.Border.svg';

#[derive(Drop)]
struct TemplateData {
    project: ProjectStaticData,
    token_name: String,
    token_description: String,
    external_url: String,
    youtube_url: String,
    status: String,
    project_area: String,
    end_year: String,
    project_capacity: String,
    asset_capacity: String,
    asset_area: String,
    // SVG specific data
    asset_area_formatted: String,
    progress: String,
    sdg_components: String,
    sdg_count: String,
    badge_size: String,
    // Components data
    background_image: String,
    progress_bar_component: String,
    status_component: String,
    badge_component: String,
    border_component: String,
}

#[inline(always)]
fn generate(static: ProjectStaticData, storage: StorageData) -> TemplateData {
    let token_name: String = static.name;
    let token_description: String = static.description;
    let status: ProjectStatus = get_status_(storage);
    let size: AssetSize = get_asset_size_(static, storage);
    let null = array![''].span();

    TemplateData {
        project: static,
        token_name,
        token_description,
        external_url: common_data::get_external_url(),
        youtube_url: common_data::get_youtube_url(),
        status: status.to_string(),
        project_area: array![static.area.to_ascii()].span(),
        end_year: array![static.end_year.to_ascii()].span(),
        project_capacity: array![static.projected_cu.to_ascii()].span(),
        asset_capacity: get_asset_capacity_str_(storage, static),
        asset_area_formatted: get_asset_area_formatted_str_(storage, static),
        asset_area: get_asset_area_str_(storage, static),
        progress: get_progress_str_(storage, static),
        sdg_components: generate_sdgs_rows_(storage, static.sdgs),
        sdg_count: array![static.sdgs.len().to_ascii()].span(),
        badge_size: get_asset_size_(static, storage).to_string(),
        background_image: get_background_image_(storage, static),
        progress_bar_component: generate_progress_bar_(storage, static),
        status_component: generate_status_(storage, static),
        badge_component: generate_badge_(storage, size),
        border_component: generate_border_(storage, size),
    }
}

#[inline(always)]
fn get_status_(storage: StorageData) -> ProjectStatus {
    let mut status: ProjectStatus = ProjectStatus::Upcoming;
    if storage.timestamp < storage.start_time {
        status = ProjectStatus::Upcoming;
    } else if storage.timestamp < storage.final_time {
        status = ProjectStatus::Live;
    } else if storage.timestamp > storage.final_time {
        status = ProjectStatus::Ended;
    }
    status
}

#[inline(always)]
fn get_asset_size_(static: ProjectStaticData, storage: StorageData) -> AssetSize {
    // TODO: To compute when used
    AssetSize::XL
}

use metadata::interfaces::component_provider::IComponentProviderDispatcher;
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
    data.append('\\" fill=\\"#272727\\" rx=\\"2\\"/>');

    // clip path and group
    data.append('<defs>');
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
    data.append('pacity=\\".6\\" rx=\\"2\\" clip');
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

//
// Json data
//

#[inline(always)]
fn get_asset_capacity_str_(storage: StorageData, static: ProjectStaticData) -> String {
    let project_value = storage.project_value;
    let asset_value = storage.asset_value;
    let project_capacity: u256 = storage.final_absorption.into();

    if project_value.is_zero() {
        array!['N/A'].span()
    } else {
        let asset_capacity = (asset_value * project_capacity.into()) / project_value;
        asset_capacity.to_ascii().span()
    }
}

#[inline(always)]
fn get_asset_area_str_(storage: StorageData, static: ProjectStaticData) -> String {
    let project_value = storage.project_value;
    let asset_value = storage.asset_value;
    let project_area: u128 = static.area.into() * common_data::ONE_HA_IN_M2;

    if project_value.is_zero() {
        array!['N/A'].span()
    } else {
        let asset_area = (asset_value * project_area.into()) / project_value;
        let asset_area: u128 = asset_area.try_into().unwrap();
        array![asset_area.to_ascii()].span()
    }
}


#[inline(always)]
fn get_asset_area_formatted_str_(storage: StorageData, static: ProjectStaticData) -> String {
    let project_value = storage.project_value;
    let asset_value = storage.asset_value;
    let project_area: u128 = static.area.into() * common_data::ONE_HA_IN_M2;

    if project_value.is_zero() {
        array!['N/A'].span()
    } else {
        let asset_area = (asset_value * project_area.into()) / project_value;
        let asset_area: u128 = asset_area.try_into().unwrap();
        if asset_area > common_data::ONE_HA_IN_M2 {
            let asset_area = asset_area / common_data::ONE_HA_IN_M2;
            array![asset_area.to_ascii(), 'ha'].span()
        } else {
            array![asset_area.to_ascii(), 'm&#xb2;'].span()
        }
    }
}

//
// Progress component generation
//
#[inline(always)]
fn get_progress_(storage: StorageData, static: ProjectStaticData) -> u8 {
    let project_capacity = storage.final_absorption;
    let current_capacity = storage.current_absorption;
    if !project_capacity.is_zero() {
        let res = 100_u256 * current_capacity.into() / project_capacity.into();
        let res: u8 = res.try_into().unwrap();
        res
    } else {
        0_u8
    }
}

#[inline(always)]
fn get_progress_str_(storage: StorageData, static: ProjectStaticData) -> String {
    let progress = get_progress_(storage, static);
    array![progress.to_ascii()].span()
}

#[inline(always)]
fn get_progress_bar_props_(
    storage: StorageData, static: ProjectStaticData
) -> sft::progress_bar::Properties {
    let status = get_status_(storage);
    let progress = get_progress_(storage, static);

    let (
        stroke_outer,
        stroke_outer_opacity,
        outer_opacity,
        stroke_inner,
        stroke_inner_opacity,
        inner_opacity,
    ) =
        match status {
        ProjectStatus::Upcoming => (
            sft::progress_bar::Stroke::Gradient(array![('.4', '#A8C4EF'), ('1', '#0AF2AD')].span()),
            Option::Some('.3'),
            Option::None,
            sft::progress_bar::Stroke::Gradient(array![('.4', '#A8C4EF'), ('1', '#0AF2AD')].span()),
            Option::Some('.8'),
            Option::None
        ),
        ProjectStatus::Live => (
            sft::progress_bar::Stroke::Gradient(array![('.4', '#A8C4EF'), ('1', '#0AF2AD')].span()),
            Option::Some('.3'),
            Option::None,
            sft::progress_bar::Stroke::Gradient(array![('.4', '#A8C4EF'), ('1', '#0AF2AD')].span()),
            Option::Some('.8'),
            Option::None
        ),
        ProjectStatus::Paused => (
            sft::progress_bar::Stroke::Gradient(array![('0', '#EA8C55'), ('1', '#916B33')].span()),
            Option::Some('.3'),
            Option::None,
            sft::progress_bar::Stroke::Gradient(array![('0', '#C8510C'), ('1', '#916B33')].span()),
            Option::Some('.8'),
            Option::None
        ),
        ProjectStatus::Stopped => (
            sft::progress_bar::Stroke::Color('#f69a86'),
            Option::Some('.2'),
            Option::None,
            sft::progress_bar::Stroke::Color('#b44040'),
            Option::None,
            Option::None
        ),
        ProjectStatus::Ended => (
            sft::progress_bar::Stroke::Gradient(array![('.4', '#A8C4EF'), ('1', '#0AF2AD')].span()),
            Option::Some('.3'),
            Option::None,
            sft::progress_bar::Stroke::Gradient(array![('.4', '#A8C4EF'), ('1', '#0AF2AD')].span()),
            Option::Some('.8'),
            Option::Some('.5')
        ),
    };

    sft::progress_bar::Properties {
        x: Option::Some(175),
        y: Option::Some(243),
        progress,
        stroke_outer,
        stroke_outer_opacity,
        outer_opacity,
        stroke_inner,
        stroke_inner_opacity,
        inner_opacity
    }
}

#[inline(always)]
fn generate_progress_bar_(storage: StorageData, static: ProjectStaticData) -> String {
    let mut data: Array<felt252> = Default::default();

    let props = get_progress_bar_props_(storage, static);

    let mut args: Array<felt252> = Default::default();
    props.serialize(ref args);
    let image = get_component_instance(
        storage.component_provider, PROGRESS_BAR_COMP_ID, Option::Some(args.span())
    );

    data.concat(image);

    data.span()
}

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

fn generate_status_(storage: StorageData, static: ProjectStaticData) -> String {
    let mut data: Array<felt252> = Default::default();
    let status = get_status_(storage);
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
    data.append('dDeviation=\\"10\\"/><feBlend /');
    data.append('></filter></defs><g filter=\\"u');
    data.append('rl(#status_blur)\\" clip-path=');
    data.append('\\"url(#status_blur_clip)\\"><g');
    data.append(' filter=\\"url(#filter0_d)\\" c');
    data.append('lip-path=\\"url(#clip0)\\"><g i');
    data.append('d=\\"background_image\\" transf');
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

fn get_border_props_(size: AssetSize) -> sft::border::Properties {
    let (stops, stroke, stroke_opacity) = match size {
        AssetSize::XS => (
            array![('0', '#60EFFF'), ('1', '#00FF87')].span(), sft::border::Gradient::Linear, '0.5'
        ),
        AssetSize::S => (
            array![('0', '#FFEDBC'), ('1', '#ED4264')].span(), sft::border::Gradient::Linear, '0.6'
        ),
        AssetSize::M => (
            array![('0', '#AB4883'), ('1', '#8785FF')].span(), sft::border::Gradient::Linear, '0.7'
        ),
        AssetSize::L => (
            array![
                ('.08', '#DEB69C'),
                ('.23', '#FFECE0'),
                ('.4', '#FFECE0'),
                ('.51', '#F0CAB2'),
                ('.57', '#775C50'),
                ('.6', '#55372C'),
                ('.71', '#7A5843'),
                ('.8', '#F0CAB2'),
                ('.92', '#54372B')
            ]
                .span(),
            sft::border::Gradient::Radial,
            '0.8'
        ),
        AssetSize::XL => (
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
            sft::border::Gradient::Radial,
            '0.9'
        ),
        AssetSize::Infinite => (
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
            sft::border::Gradient::Radial,
            '0.8'
        ),
    };

    sft::border::Properties { x: Option::None, y: Option::None, stroke, stroke_opacity, stops }
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
fn get_background_image_(storage: StorageData, static: ProjectStaticData) -> String {
    let args: Option<Span<felt252>> = Option::None;
    let image = get_component_instance(
        storage.component_provider, static.background_component, args
    );

    image
}
