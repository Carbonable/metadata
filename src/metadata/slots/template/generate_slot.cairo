use starknet::ContractAddress;

use metadata::metadata::common::data as common_data;
use metadata::metadata::common::models::{
    StorageData, ProjectStaticData, String, Shortstring, ProjectStatus, AssetSize, ToString
};
use metadata::metadata::common::utils::ToSpanOption;
use metadata::metadata::slots::template::{svg, storage, data as template_data};

use metadata::metadata::slots::template::data::TemplateData;

use cairo_json::json_metadata::{JsonMetadata, JsonMetadataTrait, DisplayType};
use alexandria_ascii::ToAsciiTrait;

#[inline(always)]
fn add_metadata_members_(ref metadata: JsonMetadata, data: @TemplateData) {
    metadata.add_member('name', *data.token_name);
    metadata.add_member('description', *data.token_description);
    metadata.add_member('image_data', svg::generate(data));
    metadata
        .add_member(
            'banner_image_url',
            array!['ipfs://Qmdjj76nkc1HQn8Tr3ertWs9', 'eWkFMBxXQkGwjHEp6mWbig', '/banner.png']
                .span()
        );
    metadata.add_member('external_url', *data.external_url);
    metadata.add_member('youtube_url', common_data::get_youtube_url());
}

#[inline(always)]
fn add_metadata_attributes_(ref metadata: JsonMetadata, data: @TemplateData) {
    let Null = DisplayType::Null;
    let Number = DisplayType::Number;

    // Project attributes
    metadata.add_attribute(Null, 'Status'.to_span(), *data.status);
    metadata.add_attribute(Null, 'Project Developer'.to_span(), *data.project.developer);
    metadata.add_attribute(Null, 'Certifier'.to_span(), *data.project.certifier);
    metadata.add_attribute(Null, 'Country'.to_span(), *data.project.country);
    metadata.add_attribute(Null, 'Project Color'.to_span(), *data.project.color);
    metadata.add_attribute(Null, 'Project Type'.to_span(), *data.project.type_);
    metadata.add_attribute(Null, 'Project Category'.to_span(), *data.project.category);
    metadata.add_attribute(Null, 'Source'.to_span(), *data.project.source);
    metadata.add_attribute(Number, 'Project Area (ha)'.to_span(), *data.project_area);
    metadata.add_attribute(Number, 'End year'.to_span(), *data.end_year);
    metadata.add_attribute(Number, 'Project Carbon Units'.to_span(), *data.project_carbon_units);
}

#[inline(always)]
fn generate_json_(data: @TemplateData) -> JsonMetadata {
    let mut metadata: JsonMetadata = JsonMetadata {
        members: Default::default(), attributes: Default::default()
    };

    // Add Metadata members
    add_metadata_members_(ref metadata, data);

    // Add Metadata attributes
    add_metadata_attributes_(ref metadata, data);

    metadata
}

#[inline(always)]
fn generate_slot_uri(
    contract_address: ContractAddress, slot: u256, static_data: ProjectStaticData
) -> Span<felt252> {
    let mut uri: Array<felt252> = Default::default();
    uri.append('data:application/json,');

    let starknet_data = storage::fetch_slot_data(contract_address, slot);
    let template_data = generate_data(static_data, starknet_data);
    let metadata: JsonMetadata = generate_json_(@template_data);

    metadata.append_to_string(ref uri);

    uri.span()
}


#[inline(always)]
fn generate_data(static: ProjectStaticData, storage: StorageData) -> TemplateData {
    // Reusing the token template
    let token_name: String = static.name;
    let token_description: String = static.description;
    let status: ProjectStatus = template_data::get_status_(storage);
    let size: AssetSize = template_data::get_asset_size_(static, storage);
    let empty = array![''].span();
    let total_project_cu = storage.final_absorption / storage.ton_equivalent;
    let project_remaining_cu = (storage.final_absorption - storage.current_absorption)
        / storage.ton_equivalent;

    TemplateData {
        project: static,
        token_name,
        token_description,
        external_url: static.external_url,
        youtube_url: common_data::get_youtube_url(),
        status: status.to_string(),
        project_area: array![static.area.to_ascii()].span(),
        end_year: array![static.end_year.to_ascii()].span(),
        project_carbon_units: array![project_remaining_cu.to_ascii()].span(),
        asset_carbon_units: array![static.total_cu.to_ascii(), 't'].span(),
        lifetime_asset_carbon_units: empty,
        asset_area_formatted: array![static.area.to_ascii(), 'ha'].span(),
        asset_area: empty,
        progress: template_data::get_progress_str_(storage, static),
        sdg_components: template_data::generate_sdgs_rows_(storage, static.sdgs),
        sdg_count: array![static.sdgs.len().to_ascii()].span(),
        badge_size: template_data::get_asset_size_(static, storage).to_string(),
        background_image: template_data::get_background_image_(storage, static),
        progress_bar_component: template_data::generate_progress_bar_(storage, static),
        status_component: template_data::generate_status_(storage, static),
        badge_component: template_data::generate_badge_(storage, size),
        border_component: template_data::generate_border_(storage, size),
    }
}
