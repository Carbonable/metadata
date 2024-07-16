use metadata::interfaces::component_provider::IComponentProviderDispatcher;

#[derive(Copy, Drop, Serde)]
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

#[derive(Drop, Copy, Serde)]
struct CarbonVintage {
	/// The year of the vintage
	year: u256,
	/// The total supply of Carbon Credit of this vintage.
	supply: u128,
	/// The total amount of Carbon Credit that failed during audits.
	failed: u128,
	/// The status of the Carbon Credit of this Vintage.
	status: CarbonVintageType, // Unset, Projected, Confirmed, Audited
}

#[derive(Drop, Copy)]
struct CPV3TemplateData {
    
}

#[derive(Drop, Copy)]
struct CPV3StorageData {
    component_provider: IComponentProviderDispatcher,
    project_carbon: u128,
    token_id: u256,
    vintage: CarbonVintage,
    timestamp: u64,
}

#[derive(Drop, Copy)]
struct CPV3StaticData {

}
