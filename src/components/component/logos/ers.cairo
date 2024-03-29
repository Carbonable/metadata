const NAME: felt252 = 'logo.ERS.svg';

#[starknet::contract]
mod Component {
    use metadata::interfaces::component::IComponent;
    use metadata::components::configs::svg;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: svg::Properties = svg::parse_properties(args);

            let mut data: Array<felt252> = Default::default();
            svg::add_header_helper(props, ref data);

            data.append(' viewBox=\\"0 0 51 61\\" fi');
            data.append('ll=\\"none\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\"><path d=');
            data.append('\\"M18.0435 41.889L16.1607 46.8');
            data.append('835H1.8828L0 60.7391H13.6503L15');
            data.append('.2977 56.228C16.0822 54.1335 18');
            data.append('.1219 52.6835 20.3185 52.6835H4');
            data.append('3.7751L45.6579 38.8279H22.3582C');
            data.append('20.4754 38.9085 18.7495 40.1168');
            data.append(' 18.0435 41.889Z\\" fill=\\"#F5');
            data.append('F5F5\\"/><path d=\\"M17.965 36.');
            data.append('814C18.7495 34.7196 20.7892 33.');
            data.append('2696 22.9858 33.2696H38.5189L40');
            data.append('.4017 19.414H24.9471C23.0643 19');
            data.append('.414 21.3384 20.6223 20.7108 22');
            data.append('.3945L18.828 27.4695H4.5501L2.6');
            data.append('673 41.3251H16.3176L17.965 36.8');
            data.append('14Z\\" fill=\\"#F5F5F5\\"/><pat');
            data.append('h d=\\"M23.2212 2.98057L21.3384');
            data.append(' 8.05558H7.0605L5.1777 21.8306H');
            data.append('18.828L20.4754 17.3195C21.2599');
            data.append(' 15.2251 23.2996 13.775 25.4962');
            data.append(' 13.775H48.9528L50.8356 0H27.45');
            data.append('75C25.5747 0 23.9272 1.20834 23');
            data.append('.2212 2.98057Z\\" fill=\\"#F5F5F');
            data.append('5\\"/></svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use debug::PrintTrait;
    use test::test_utils::assert_eq;

    use super::Component;
    use metadata::components::configs::svg;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(320_000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());

        assert_eq(@data.len(), @28_u32, 'Couldn\'t get data');
    }
}
