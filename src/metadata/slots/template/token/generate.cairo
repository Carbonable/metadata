use starknet::ContractAddress;

use metadata::metadata::common::data as common_data;
use metadata::metadata::common::models::{ProjectStaticData, StorageData};
use metadata::metadata::common::utils::ToSpanOption;
use metadata::metadata::slots::template::token::{svg, storage, data as template_data};
use metadata::metadata::slots::template::token::data::TemplateData;

use cairo_json::json_metadata::{JsonMetadata, JsonMetadataTrait, DisplayType};
use alexandria_ascii::ToAsciiTrait;

fn add_metadata_members_(ref metadata: JsonMetadata, data: @TemplateData) {
    metadata.add_member('name', *data.project.description);
    metadata.add_member('description', *data.token_description);
    metadata.add_member('external_url', common_data::get_external_url());
    metadata.add_member('youtube_url', common_data::get_youtube_url());
    metadata.add_member('image', svg::generate(data));
}

fn add_metadata_attributes_(ref metadata: JsonMetadata, data: @TemplateData) {
    let Null = DisplayType::Null;
    let Number = DisplayType::Number;

    // Project attributes
    metadata.add_attribute(Null, 'Status'.to_span(), *data.status);
    metadata.add_attribute(Null, 'Project developer'.to_span(), *data.project.developer);
    metadata.add_attribute(Null, 'Certifier'.to_span(), *data.project.certifier);
    metadata.add_attribute(Null, 'Country'.to_span(), *data.project.country);
    metadata.add_attribute(Null, 'Project Color'.to_span(), *data.project.color);
    metadata.add_attribute(Null, 'Project Type'.to_span(), *data.project.type_);
    metadata.add_attribute(Null, 'Project Category'.to_span(), *data.project.category);
    metadata.add_attribute(Null, 'Source'.to_span(), *data.project.source);
    metadata.add_attribute(Number, 'Project Area (ha)'.to_span(), *data.project_area);

    // TODO: Mutable and DisplayType::Date
    metadata.add_attribute(Number, 'End date'.to_span(), *data.end_year);

    // TODO: Fetch from contract
    metadata.add_attribute(Number, 'Total Carbon Units'.to_span(), *data.project_capacity);

    // Token attributes
    metadata.add_attribute(Number, 'Asset avg. annual capacity'.to_span(), *data.asset_capacity);
    metadata.add_attribute(Number, 'Asset area (m)'.to_span(), *data.asset_area);
}

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

fn generate_token_uri(
    contract_address: ContractAddress, token_id: u256, static_data: ProjectStaticData
) -> Span<felt252> {
    let mut uri: Array<felt252> = Default::default();
    uri.append('data:application/json,');

    let starknet_data = storage::fetch_data(contract_address, token_id);
    let template_data = template_data::generate(static_data, starknet_data);
    let metadata: JsonMetadata = generate_json_(@template_data);

    metadata.append_to_string(ref uri); // render method?

    uri.span()
}
