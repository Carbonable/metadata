use array::ArrayTrait;
use core::Zeroable;
use core::{Into, TryInto};
use option::OptionTrait;

use metadata::metadata::common::models::{StorageData, TokenData};
use metadata::metadata::common::utils::{ToSpanOption};
use alexandria_ascii::ToAsciiTrait;

// TODO: to be used in 'Asset avg. annual capacity' attribute
fn get_asset_capacity(data: TokenData) -> Span<felt252> {
    let project_value = data.slot_data.project_value;

    Default::default().span()
}

// TODO: to be used in 'Asset area (m2)' attribute
fn get_asset_area(data: TokenData) -> Span<felt252> {
    let project_value = data.slot_data.project_value;
    let project_area = data.slot_data.project_data.area;

    Default::default().span()
}

fn get_progress(data: TokenData) -> u8 {
    // TODO: fetch from contract ???
    let project_cu = data.slot_data.project_data.projected_cu;
    // let current_cu = storage_data.current_absorption;
    let current_cu: u256 = 123_u256;
    if !current_cu.is_zero() {
        let res = 100_u256 * current_cu / project_cu;
        // TODO: check result is < 100 ?
        let res: u8 = res.try_into().unwrap();
        res
    } else {
        // TODO: check Status?
        0_u8
    }
}

// TODO: get SFT colors (Status + Progress bar)
fn get_colors(data: TokenData) -> Span<felt252> {
    // match status
    // status circle
    // status text
    // status border

    let colors = array!['#000000', '#000000', '#000000', '#000000', '#000000'];
    let colors = colors.span();
    colors
}

// Needed?
use metadata::metadata::common::models::String;

struct SvgData {
    status: String,
}

fn get_svg_data() -> SvgData {
    SvgData { status: 'Live'.to_span().unwrap() }
}
