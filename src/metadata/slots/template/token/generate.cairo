use array::{ArrayTrait, SpanTrait};
use core::{Into, TryInto};
use option::OptionTrait;
use core::Zeroable;
use starknet::ContractAddress;


use metadata::metadata::common::data as common_data;
use metadata::metadata::common::models::{ProjectData, TokenData, StorageData};
use metadata::metadata::common::utils::{to_ascii, ToSpanOption};
use metadata::metadata::slots::template::token::svg;
use metadata::metadata::slots::template::token::storage;
use metadata::metadata::slots::template::token::data as template_data;


use cairo_json::json_metadata::{JsonMetadata, JsonMetadataTrait, DisplayType};
use alexandria_ascii::ToAsciiTrait;

mod json_template {
    use cairo_json::json_metadata::{JsonMetadata, JsonMetadataTrait, DisplayType};
    use metadata::metadata::common::data as common_data;
    use metadata::metadata::common::models::{ProjectData, TokenData, StorageData};
    use metadata::metadata::common::utils::{to_ascii, ToSpanOption};
    use super::svg;

    fn add_metadata_members(ref metadata: JsonMetadata, data: TokenData) {
        metadata.add_member('name', data.description);
        metadata.add_member('description', data.description);
        metadata.add_member('external_url', common_data::get_external_url());
        metadata.add_member('youtube_url', common_data::get_youtube_url());
        metadata.add_member('image', svg::generate(data));
    }

    fn add_metadata_attributes(ref metadata: JsonMetadata, project_data: ProjectData) {
        let Null = DisplayType::Null;
        let Number = DisplayType::Number;

        // Project attributes
        // TODO: status dynamic change + enum?
        metadata.add_attribute(Null, 'Status'.to_span(), project_data.status);
        metadata.add_attribute(Null, 'Project developer'.to_span(), project_data.developer);
        metadata.add_attribute(Null, 'Certifier'.to_span(), project_data.certifier);
        metadata.add_attribute(Null, 'Country'.to_span(), project_data.country);
        metadata.add_attribute(Null, 'Project Color'.to_span(), project_data.color);
        metadata.add_attribute(Null, 'Project Type'.to_span(), project_data.type_);
        metadata.add_attribute(Null, 'Project Category'.to_span(), project_data.category);
        metadata.add_attribute(Null, 'Source'.to_span(), project_data.source);
        metadata.add_attribute(Number, 'Project Area (ha)'.to_span(), to_ascii(project_data.area));

        // TODO: Mutable??
        metadata
            .add_attribute(
                Number, 'End date'.to_span(), to_ascii(project_data.end_year)
            ); // DisplayType::Date 

        // TODO: Fetch from contract
        metadata
            .add_attribute(
                Number, 'Total Carbon Units'.to_span(), to_ascii(project_data.projected_cu)
            );

        // Token attributes
        // TODO: construct dynamically
        metadata
            .add_attribute(Number, 'Asset avg. annual capacity'.to_span(), to_ascii('TODO'_u128));
        metadata.add_attribute(Number, 'Asset area (m)'.to_span(), to_ascii('TODO'_u128));
    }

    fn render(data: TokenData) -> JsonMetadata {
        let mut metadata: JsonMetadata = JsonMetadata {
            members: Default::default(), attributes: Default::default()
        };

        // Add Metadata members
        add_metadata_members(ref metadata, data);

        // Add Metadata attributes
        add_metadata_attributes(ref metadata, data.slot_data.project_data);

        metadata
    }
}

fn generate_token_uri(
    contract_address: ContractAddress, token_id: u256, static_data: TokenData
) -> Span<felt252> {
    let mut uri: Array<felt252> = Default::default();
    uri.append('data:application/json,');

    let starknet_data = storage::fetch_storage_data(contract_address, token_id);
    let template_data = template_data::generate(static_data, starknet_data);
    //  let svg_data = svg::compute_data(starknet_data, static_data); // todo: inside json?
    //  let json_data_ = data::json_data::compute_data(starknet_data, static_data);
    let metadata: JsonMetadata = json_template::render(static_data);

    metadata.append_to_string(ref uri);

    uri.span()
}
