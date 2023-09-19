use alexandria_ascii::ToAsciiArrayTrait;

type Shortstring = felt252;
type String = Span<Shortstring>;

#[derive(Copy, Drop)]
struct StorageData {
    asset_value: u256,
    total_value: u256,
    project_value: u256,
    slot: u256,
}

#[derive(Copy, Drop)]
struct SlotData {
    project_data: ProjectStaticData,
    total_value: u256,
    project_value: u256,
    slot: u256,
    status: ProjectStatus,
    description: String,
}

#[derive(Copy, Drop)]
enum ProjectStatus {
    Upcoming,
    Live,
    Paused,
    Stopped,
    Ended
}

trait ToString<T> {
    fn to_string(self: T) -> String;
}

impl ProjectStatusToStringImpl of ToString<ProjectStatus> {
    fn to_string(self: ProjectStatus) -> String {
        let status = match self {
            ProjectStatus::Upcoming => array!['Upcoming'],
            ProjectStatus::Live => array!['Live'],
            ProjectStatus::Paused => array!['Paused'],
            ProjectStatus::Stopped => array!['Stopped'],
            ProjectStatus::Ended => array!['Ended'],
        };
        status.span()
    }
}

#[derive(Drop, Copy)]
enum AssetSize {
    XS,
    S,
    M,
    L,
    XL,
    Infinite,
}

impl AssetSizeToStringImpl of ToString<AssetSize> {
    fn to_string(self: AssetSize) -> String {
        let size = match self {
            AssetSize::XS => array!['XS'],
            AssetSize::S => array!['S'],
            AssetSize::M => array!['M'],
            AssetSize::L => array!['L'],
            AssetSize::XL => array!['XL'],
            AssetSize::Infinite => array!['&#8734;'],
        };
        size.span()
    }
}

#[derive(Copy, Drop)]
struct ProjectStaticData {
    name: String,
    description: String,
    developer: String,
    certifier: String,
    area: u32,
    country: String,
    end_year: u32, // TODO: remove and dynamize
    end_month: u8, // TODO: remove and dynamize
    duration_in_years: u32, // TODO: remove and dynamize
    projected_cu: u128, // TODO: remove and dynamize
    // status: ProjectStatus, // TODO: remove and dynamize
    color: String, // Color
    type_: String, // Type
    category: String, // Category
    source: String, // Source
    sdgs: Span<u8>,
    background_component: Shortstring,
}
