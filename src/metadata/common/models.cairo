use alexandria_ascii::ToAsciiArrayTrait;

type String = Span<felt252>;

#[derive(Copy, Drop)]
struct StorageData {
    asset_value: u256,
    total_value: u256,
    project_value: u256,
    slot: u256,
}

#[derive(Copy, Drop)]
struct TokenData {
    slot_data: SlotData,
    asset_value: u256,
    description: Span<felt252>,
    token_id: u256,
}

#[derive(Copy, Drop)]
struct SlotData {
    project_data: ProjectStaticData,
    total_value: u256,
    project_value: u256,
    slot: u256,
    status: ProjectStatus,
    description: Span<felt252>,
}

#[derive(Copy, Drop)]
enum ProjectStatus {
    Upcoming,
    Live,
    Paused,
    Stopped,
    Ended
}

trait ProjectStatusToString {
    fn to_string(self: ProjectStatus) -> String;
}

impl ProjectStatusToStringImpl of ProjectStatusToString {
    fn to_string(self: ProjectStatus) -> String {
        let status = match self {
            ProjectStatus::Upcoming => 'Upcoming'_u128.to_ascii_array(),
            ProjectStatus::Live => 'Live'_u128.to_ascii_array(),
            ProjectStatus::Paused => 'Paused'_u128.to_ascii_array(),
            ProjectStatus::Stopped => 'Stopped'_u128.to_ascii_array(),
            ProjectStatus::Ended => 'Ended'_u128.to_ascii_array(),
        };
        status.span()
    }
}

#[derive(Copy, Drop)]
struct ProjectStaticData {
    name: String,
    description: String,
    developer: String,
    certifier: String,
    area: u256,
    country: String,
    end_year: u256, // TODO: remove and dynamize
    end_month: u256, // TODO: remove and dynamize
    duration_in_years: u256, // TODO: remove and dynamize
    projected_cu: u256, // TODO: remove and dynamize
    // status: ProjectStatus, // TODO: remove and dynamize
    color: String, // Color
    type_: String, // Type
    category: String, // Category
    source: String, // Source
    sdgs: Span<felt252>,
    background_component: felt252,
    certifier_component: felt252
}
