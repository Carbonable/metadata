use metadata::interfaces::component_provider::IComponentProviderDispatcher;
use metadata::metadata::common::models::{
    ProjectStaticData, String, Shortstring, ProjectStatus, AssetSize, ToString
};

#[derive(Copy, Drop, Serde, Default, PartialEq)]
enum CarbonVintageType {
    #[default]
    /// Unset: the Carbon Credit is not yet created nor projected.
    Unset,
    ///  Projected: the Carbon Credit is not yet created and was projected during certification of the project.
    Projected,
    ///  Confirmed: the Carbon Credit is confirmed by a dMRV analyse.
    Confirmed,
    ///  Audited: the Carbon Credit is audited by a third Auditor.
    Audited,
}

impl CarbonVintageTypeDisplay of Into<CarbonVintageType, felt252> {
    fn into(self: CarbonVintageType) -> felt252 {
        match self {
            CarbonVintageType::Unset => 'Unset',
            CarbonVintageType::Projected => 'Projected',
            CarbonVintageType::Confirmed => 'Confirmed',
            CarbonVintageType::Audited => 'Audited',
        }
    }
}

#[derive(Copy, Drop, Debug, Serde, PartialEq, Default)]
struct CarbonVintage {
    /// The year of the vintage
    year: u32,
    /// The total supply of Carbon Credit for this vintage.
    supply: u256,
    /// The total amount of Carbon Credit that was failed during audits.
    failed: u256,
    /// The total amount of Carbon Credit that was created during audits.
    created: u256,
    /// The status of the Carbon Credit of this Vintage. 
    status: CarbonVintageType,
}

#[derive(Drop, Copy)]
struct CPV3TemplateData {
    // General
    external_url: String,
    youtube_url: String,
    // Project
    project: ProjectStaticData,
    project_area: String,
    project_carbon_units: String,
    project_name: String,
    project_description: String,
    //Vintage
    vintage_year: String,
    vintage_supply: String,
    vintage_supply_fmt: String,
    vintage_type: String,
    vintage_failed: String,
    // SVG specific data
    asset_carbon_units: String,
    sdg_components: String,
    sdg_count: String,
    // Components data
    background_image: String,
    status_component: String,
    border_component: String,
}

#[derive(Drop, Copy)]
struct CPV3StorageData {
    component_provider: IComponentProviderDispatcher,
    project_carbon: u128,
    token_id: u256,
    vintage: CarbonVintage,
    timestamp: u64,
    start_year: u32,
    end_year: u32,
}

#[derive(Drop, Copy)]
struct CPV3StaticData {}

