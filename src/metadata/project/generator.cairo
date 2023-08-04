// TODO
// Get data from contract
// Generate SVG from template

use starknet::get_contract_address;
use metadata::metadata::project::data;
use cairo_json::simple_json::{Json, JsonTrait};
use array::ArrayTrait;
use metadata::metadata::common::constants;

fn generate_contract_uri(data: felt252) -> Span<felt252> {
    let mut uri = Default::default();
    uri.append('data:application/json,');

    // data::DescriptionData::add_description(ref uri);

    let mut metadata: Json = Json { members: Default::default() };
    metadata.add('description', data::DescriptionData::description().span());
    metadata.add('external_url', constants::get_external_url());
    metadata.add('banner_image_url', constants::get_banner_img_url());
    metadata.add('youtube_url', constants::get_youtube_url());
    metadata.add('image', data::ContractSVG::get_carbonable_logo());

    // Need to use integer to_ascii 
    // metadata.add('project_count', data::Starknet::get_project_count());

    metadata.append_to_string(ref uri);
    uri.span()
}

