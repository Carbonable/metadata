use array::ArrayTrait;
use core::Zeroable;
use core::{Into, TryInto};
use option::OptionTrait;

use metadata::metadata::common::data as common_data;
use metadata::metadata::common::models::{
    StorageData, ProjectStaticData, String, ProjectStatus, ProjectStatusToString
};
use metadata::metadata::common::utils::{ToSpanOption};
use alexandria_ascii::ToAsciiTrait;
use alexandria_ascii::ToAsciiArrayTrait;


#[derive(Drop)]
struct TemplateData {
    project: ProjectStaticData,
    token_name: String,
    token_description: String,
    external_url: String,
    youtube_url: String,
    status_str: String,
    project_area_str: String,
    project_end_year_str: String,
    project_projected_cu_str: String,
    asset_capacity_str: String,
    asset_area_str: String,
    // SVG specific data
    progress: u8,
    progress_str: String,
    sdgs_span: Span<felt252>,
    sdg_count_str: String,
    // Components data
    background_comp_id: felt252,
    certifier_comp_id: felt252, // TODO: to be removed?
    progress_bar_comp_id: felt252,
    status_comp_id: felt252,
    game_badge_comp_id: felt252,
    card_border_comp_id: felt252,
}

struct ComponentInstance {
    id: felt252,
    properties: Span<felt252>
}

#[inline(always)]
fn generate(static_data: ProjectStaticData, starknet_data: StorageData) -> TemplateData {
    let token_name = static_data.name;
    let token_description = static_data.description;
    let status = get_status_(starknet_data);
    TemplateData {
        project: static_data,
        token_name,
        token_description,
        external_url: common_data::get_external_url(),
        youtube_url: common_data::get_youtube_url(),
        status_str: status.to_string(),
        project_area_str: static_data.area.to_ascii_array().span(),
        project_end_year_str: static_data.end_year.to_ascii_array().span(),
        project_projected_cu_str: static_data.projected_cu.to_ascii_array().span(),
        asset_capacity_str: get_asset_capacity_str_(starknet_data, static_data),
        asset_area_str: get_asset_area_str_(starknet_data, static_data),
        progress: get_progress_(starknet_data, static_data),
        progress_str: get_progress_str_(starknet_data, static_data),
        sdgs_span: static_data.sdgs,
        sdg_count_str: static_data.sdgs.len().to_ascii_array().span(),
        // Components data
        background_comp_id: static_data.background_component,
        certifier_comp_id: static_data.certifier_component, // TODO: to be removed?
        // TODO: fetch components right away?
        progress_bar_comp_id: 'SFT.ProgressBar.svg',
        status_comp_id: 'SFT.Status.svg',
        game_badge_comp_id: 'SFT.Badge.svg',
        card_border_comp_id: 'SFT.Border.svg',
    }
}

fn get_status_(data: StorageData) -> ProjectStatus {
    // TODO
    ProjectStatus::Live
}

// TODO: to be used in 'Asset avg. annual capacity' attribute
#[inline(always)]
fn get_asset_capacity_str_(storage: StorageData, static_data: ProjectStaticData) -> Span<felt252> {
    let project_value = storage.project_value;

    Default::default().span()
}

// TODO: to be used in 'Asset area (m2)' attribute
#[inline(always)]
fn get_asset_area_str_(storage: StorageData, static_data: ProjectStaticData) -> Span<felt252> {
    let project_value = storage.project_value;
    let project_area = static_data.area;

    Default::default().span()
}

#[inline(always)]
fn get_progress_(storage: StorageData, static_data: ProjectStaticData) -> u8 {
    // TODO: fetch from contract ???
    let project_cu = static_data.projected_cu;
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

fn get_progress_str_(storage: StorageData, static_data: ProjectStaticData) -> String {
    Default::default().span()
}

// TODO: get SFT colors (Status + Progress bar)
#[inline(always)]
fn get_colors(storage: StorageData, static_data: ProjectStaticData) -> Span<felt252> {
    // match status
    // status circle
    // status text
    // status border

    let colors = array!['#000000', '#000000', '#000000', '#000000', '#000000'];
    let colors = colors.span();
    colors
}

