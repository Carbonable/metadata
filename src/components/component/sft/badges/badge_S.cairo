const NAME: felt252 = 'SFT.BadgeS.svg';

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

            data.append(' width=\\"40\\" height=\\"45\\"');
            data.append(' viewBox=\\"0 0 40 45\\" fill=');
            data.append('\\"none\\" xmlns=\\"http://www.');
            data.append('w3.org/2000/svg\\"><g clip-path');
            data.append('=\\"url(#clip0_small)\\"><g fil');
            data.append('ter=\\"url(#filter0_b_small)\\"');
            data.append('><path d=\\"M17.6784 1.25982C19');
            data.append('.131 0.471559 20.8793 0.45204 2');
            data.append('2.3492 1.20768L29.2683 4.76471L');
            data.append('37.3761 9.14371C38.9925 10.0167');
            data.append(' 40 11.7059 40 13.5431V22.2353V');
            data.append('30.7341C40 32.5333 39.0333 34.1');
            data.append('939 37.4686 35.0822L22.4686 43.');
            data.append('5984C20.9377 44.4677 19.0624 44');
            data.append('.4677 17.5314 43.5984L2.53137 3');
            data.append('5.0822C0.966714 34.1939 0 32.53');
            data.append('34 0 30.7341V22.2353V13.6056C0');
            data.append(' 11.7355 1.0436 10.0217 2.70508');
            data.append(' 9.1634L11.2195 4.76471L17.6784');
            data.append(' 1.25982Z\\" fill=\\"#D0D1D6\\"');
            data.append(' fill-opacity=\\"0.2\\"/></g><m');
            data.append('ask id=\\"path-2-inside-1_small');
            data.append('\\" fill=\\"white\\"><path d=\\');
            data.append('"M18.1161 3.97613C19.2922 3.326');
            data.append(' 20.7163 3.30994 21.9068 3.9333');
            data.append('7L27.9119 7.07804L35.0012 10.97');
            data.append('83C36.2792 11.6814 37.0731 13.0');
            data.append('244 37.0731 14.4829V22.2699V29.');
            data.append('8839C37.0731 31.3119 36.3118 32');
            data.append('.6316 35.0756 33.3465L22.0025 4');
            data.append('0.9071C20.7636 41.6236 19.2363');
            data.append(' 41.6236 17.9974 40.9071L4.9242');
            data.append('2 33.3465C3.68804 32.6316 2.926');
            data.append('76 31.3119 2.92676 29.8839V22.2');
            data.append('699V14.5333C2.92676 13.0481 3.7');
            data.append('4966 11.6851 5.06398 10.9935L12');
            data.append('.5044 7.07804L18.1161 3.97613Z');
            data.append('\\"/></mask><path d=\\"M18.1161');
            data.append(' 3.97613C19.2922 3.326 20.7163');
            data.append(' 3.30994 21.9068 3.93337L27.911');
            data.append('9 7.07804L35.0012 10.9783C36.27');
            data.append('92 11.6814 37.0731 13.0244 37.0');
            data.append('731 14.4829V22.2699V29.8839C37.');
            data.append('0731 31.3119 36.3118 32.6316 35');
            data.append('.0756 33.3465L22.0025 40.9071C2');
            data.append('0.7636 41.6236 19.2363 41.6236');
            data.append(' 17.9974 40.9071L4.92422 33.346');
            data.append('5C3.68804 32.6316 2.92676 31.31');
            data.append('19 2.92676 29.8839V22.2699V14.5');
            data.append('333C2.92676 13.0481 3.74966 11.');
            data.append('6851 5.06398 10.9935L12.5044 7.');
            data.append('07804L18.1161 3.97613Z\\" fill=');
            data.append('\\"url(#paint0_linear_small)\\"');
            data.append(' fill-opacity=\\"0.15\\" stroke');
            data.append('=\\"url(#paint1_linear_small)\\');
            data.append('" stroke-width=\\"3\\" mask=\\"');
            data.append('url(#path-2-inside-1_small)\\"/');
            data.append('><mask id=\\"mask0_small\\" sty');
            data.append('le=\\"mask-type:alpha\\" maskUn');
            data.append('its=\\"userSpaceOnUse\\" x=\\"0');
            data.append('\\" y=\\"0\\" width=\\"40\\" he');
            data.append('ight=\\"46\\"><path d=\\"M20 0.');
            data.append('000732528L29.2683 4.76544L40 10');
            data.append('.5616L40 22.236L40 33.6457L20 4');
            data.append('5.0007L-1.78451e-07 33.6457L-1.');
            data.append('17935e-07 22.236L-5.60143e-08 1');
            data.append('0.5616L11.2195 4.76544L20 0.000');
            data.append('732528Z\\" fill=\\"#E1E7EA\\"/>');
            data.append('</mask><g mask=\\"url(#mask0_sm');
            data.append('all)\\"><rect opacity=\\"0.1\\"');
            data.append(' width=\\"47.8878\\" height=\\"');
            data.append('22.3042\\" transform=\\"matrix(');
            data.append('0.600773 -0.799419 0.79785 0.60');
            data.append('2857 5.2915 41.7463)\\" fill=\\');
            data.append('"#191A20\\"/></g><text fill=\\"');
            data.append('#EBECF0\\" xml:space=\\"preserv');
            data.append('e\\" style=\\"white-space: pre');
            data.append('\\" font-family=\\"Inter\\" fon');
            data.append('t-size=\\"15\\" font-weight=\\"');
            data.append('bold\\" letter-spacing=\\"0em\\');
            data.append('"><tspan x=\\"15.0854\\" y=\\"2');
            data.append('8.4545\\">S</tspan></text></g><');
            data.append('defs><filter id=\\"filter0_b_sm');
            data.append('all\\" x=\\"-4\\" y=\\"-3.34552');
            data.append('\\" width=\\"48\\" height=\\"51');
            data.append('.5959\\" filterUnits=\\"userSpa');
            data.append('ceOnUse\\" color-interpolation-');
            data.append('filters=\\"sRGB\\"><feFlood flo');
            data.append('od-opacity=\\"0\\" result=\\"Ba');
            data.append('ckgroundImageFix\\"/><feGaussia');
            data.append('nBlur in=\\"BackgroundImageFix');
            data.append('\\" stdDeviation=\\"2\\"/><feCo');
            data.append('mposite in2=\\"SourceAlpha\\" o');
            data.append('perator=\\"in\\" result=\\"effe');
            data.append('ct1_backgroundBlur_small\\"/><f');
            data.append('eBlend mode=\\"normal\\" in=\\"');
            data.append('SourceGraphic\\" in2=\\"effect1');
            data.append('_backgroundBlur_small\\" result');
            data.append('=\\"shape\\"/></filter><linearG');
            data.append('radient id=\\"paint0_linear_sma');
            data.append('ll\\" x1=\\"2.92676\\" y1=\\"22');
            data.append('.5\\" x2=\\"37.0731\\" y2=\\"22');
            data.append('.5\\" gradientUnits=\\"userSpac');
            data.append('eOnUse\\"><stop stop-color=\\"#');
            data.append('FFEDBC\\"/><stop offset=\\"1\\"');
            data.append(' stop-color=\\"#ED4264\\"/></li');
            data.append('nearGradient><linearGradient id');
            data.append('=\\"paint1_linear_small\\" x1=');
            data.append('\\"2.92676\\" y1=\\"22.5\\" x2=');
            data.append('\\"37.0731\\" y2=\\"22.5\\" gra');
            data.append('dientUnits=\\"userSpaceOnUse\\"');
            data.append('><stop stop-color=\\"#FFEDBC\\"');
            data.append('/><stop offset=\\"1\\" stop-col');
            data.append('or=\\"#ED4264\\"/></linearGradi');
            data.append('ent><clipPath id=\\"clip0_small');
            data.append('\\"><rect width=\\"40\\" height');
            data.append('=\\"45\\" fill=\\"white\\"/></c');
            data.append('lipPath></defs></svg>');

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
    #[available_gas(840000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @120_u32, 'Couldn\'t get data');
    }
}
