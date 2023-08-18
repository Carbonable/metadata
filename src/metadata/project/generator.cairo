use array::ArrayTrait;

use cairo_json::simple_json::{Json, JsonTrait};

use metadata::metadata::project::data;
use metadata::metadata::common::data as common_data;

#[inline(always)]
fn generate_contract_uri() -> Span<felt252> {
    let mut uri = Default::default();
    uri.append('data:application/json,');

    let mut metadata: Json = Json { members: Default::default() };
    metadata.add('description', data::Description::get().span());
    metadata.add('external_url', common_data::get_external_url());
    metadata.add('banner_image_url', common_data::get_banner_img_url());
    metadata.add('youtube_url', common_data::get_youtube_url());

    // TODO: add MIME type for SVG
    metadata.add('image', data::SVG::get_carbonable_logo());

    // Need to use integer to_ascii 
    // metadata.add('project_count', data::Starknet::get_project_count());
    metadata.append_to_string(ref uri);

    uri.span()
}

