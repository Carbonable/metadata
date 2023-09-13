const NAME: felt252 = 'SFT.BadgeInfty.svg';
#[starknet::contract]
mod Component {
    use array::ArrayTrait;
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

            data.append(' width=\\"46\\" height=\\"45\\"');
            data.append(' viewBox=\\"0 0 46 45\\" fill=');
            data.append('\\"none\\" xmlns=\\"http://www.');
            data.append('w3.org/2000/svg\\"><g filter=\\');
            data.append('"url(#filter0_b_infty)\\"><path');
            data.append(' d=\\"M10.3695 5.26662C11.2334');
            data.append(' 3.85765 12.7377 2.96659 14.388');
            data.append('5 2.88606L22.1591 2.50698L31.37');
            data.append('02 2.24542C33.2066 2.19327 34.9');
            data.append('237 3.15239 35.8422 4.7434L40.1');
            data.append('884 12.2711L44.4378 19.6313C45.');
            data.append('3374 21.1895 45.3304 23.1109 44');
            data.append('.4196 24.6625L35.6873 39.5378C3');
            data.append('4.7961 41.0561 33.172 41.9937 3');
            data.append('1.4115 42.0064L14.163 42.1312C1');
            data.append('2.3638 42.1442 10.6964 41.1895');
            data.append(' 9.79674 39.6313L5.54734 32.271');
            data.append('1L1.2325 24.7976C0.297449 23.17');
            data.append('8 0.344343 21.1721 1.35405 19.5');
            data.append('98L6.52842 11.5314L10.3695 5.26');
            data.append('662Z\\" fill=\\"#D0D1D6\\" fill');
            data.append('-opacity=\\"0.2\\"/></g><mask i');
            data.append('d=\\"path-2-inside-1_infty\\" f');
            data.append('ill=\\"white\\"><path d=\\"M12.');
            data.append('1061 7.3998C12.7997 6.24869 14.');
            data.append('0249 5.52276 15.3676 5.46741L22');
            data.append('.1405 5.18822L30.2302 5.0213C31');
            data.append('.6885 4.99121 33.0475 5.75728 3');
            data.append('3.7768 7.02045L37.6703 13.7641L');
            data.append('41.4773 20.3581C42.1913 21.5948');
            data.append(' 42.1919 23.1183 41.4788 24.355');
            data.append('5L33.9374 37.4398C33.2227 38.67');
            data.append('97 31.9 39.4434 30.4689 39.4423');
            data.append('L15.3669 39.4312C13.9388 39.430');
            data.append('2 12.6197 38.6679 11.9057 37.43');
            data.append('12L8.09867 30.8373L4.23038 24.1');
            data.append('372C3.48778 22.851 3.51897 21.2');
            data.append('592 4.31138 20.0031L8.79724 12.');
            data.append('892L12.1061 7.3998Z\\"/></mask>');
            data.append('<path d=\\"M12.1061 7.3998C12.7');
            data.append('997 6.24869 14.0249 5.52276 15.');
            data.append('3676 5.46741L22.1405 5.18822L30');
            data.append('.2302 5.0213C31.6885 4.99121 33');
            data.append('.0475 5.75728 33.7768 7.02045L3');
            data.append('7.6703 13.7641L41.4773 20.3581C');
            data.append('42.1913 21.5948 42.1919 23.1183');
            data.append(' 41.4788 24.3555L33.9374 37.439');
            data.append('8C33.2227 38.6797 31.9 39.4434');
            data.append(' 30.4689 39.4423L15.3669 39.431');
            data.append('2C13.9388 39.4302 12.6197 38.66');
            data.append('79 11.9057 37.4312L8.09867 30.8');
            data.append('373L4.23038 24.1372C3.48778 22.');
            data.append('851 3.51897 21.2592 4.31138 20.');
            data.append('0031L8.79724 12.892L12.1061 7.3');
            data.append('998Z\\" fill=\\"url(#paint0_ang');
            data.append('ular_infty)\\" fill-opacity=\\"');
            data.append('0.15\\" stroke=\\"url(#paint1_a');
            data.append('ngular_infty)\\" stroke-width=');
            data.append('\\"3\\" mask=\\"url(#path-2-ins');
            data.append('ide-1_infty)\\"/><mask id=\\"ma');
            data.append('sk0_infty\\" style=\\"mask-type');
            data.append(':alpha\\" maskUnits=\\"userSpac');
            data.append('eOnUse\\" x=\\"3\\" y=\\"0\\" w');
            data.append('idth=\\"40\\" height=\\"46\\"><');
            data.append('path d=\\"M23 0.000732528L32.26');
            data.append('83 4.76544L43 10.5616L43 22.236');
            data.append('L43 33.6457L23 45.0007L3 33.645');
            data.append('7L3 22.236L3 10.5616L14.2195 4.');
            data.append('76544L23 0.000732528Z\\" fill=');
            data.append('\\"#E1E7EA\\"/></mask><g mask=');
            data.append('\\"url(#mask0_infty)\\"><rect o');
            data.append('pacity=\\"0.1\\" width=\\"47.88');
            data.append('78\\" height=\\"22.3042\\" tran');
            data.append('sform=\\"matrix(0.600773 -0.799');
            data.append('419 0.79785 0.602857 8.2915 41.');
            data.append('7463)\\" fill=\\"#191A20\\"/></');
            data.append('g><text transform=\\"translate(');
            data.append('12 14)\\" fill=\\"#EBECF0\\" xm');
            data.append('l:space=\\"preserve\\" style=\\');
            data.append('"white-space: pre\\" font-famil');
            data.append('y=\\"Inter\\" font-size=\\"19\\');
            data.append('" font-weight=\\"bold\\" letter');
            data.append('-spacing=\\"0em\\"><tspan x=\\"');
            data.append('1.65771\\" y=\\"15.4091\\">&#x2');
            data.append('21e;</tspan></text><defs><filte');
            data.append('r id=\\"filter0_b_infty\\" x=\\');
            data.append('"-3.4375\\" y=\\"-1.75659\\" wi');
            data.append('dth=\\"52.5449\\" height=\\"47.');
            data.append('8879\\" filterUnits=\\"userSpac');
            data.append('eOnUse\\" color-interpolation-f');
            data.append('ilters=\\"sRGB\\"><feFlood floo');
            data.append('d-opacity=\\"0\\" result=\\"Bac');
            data.append('kgroundImageFix\\"/><feGaussian');
            data.append('Blur in=\\"BackgroundImageFix\\');
            data.append('" stdDeviation=\\"2\\"/><feComp');
            data.append('osite in2=\\"SourceAlpha\\" ope');
            data.append('rator=\\"in\\" result=\\"effect');
            data.append('1_backgroundBlur_infty\\"/><feB');
            data.append('lend mode=\\"normal\\" in=\\"So');
            data.append('urceGraphic\\" in2=\\"effect1_b');
            data.append('ackgroundBlur_infty\\" result=');
            data.append('\\"shape\\"/></filter><radialGr');
            data.append('adient id=\\"paint0_angular_inf');
            data.append('ty\\" cx=\\"0\\" cy=\\"0\\" r=');
            data.append('\\"1.5\\" gradientUnits=\\"user');
            data.append('SpaceOnUse\\" gradientTransform');
            data.append('=\\"translate(22.5 22.5) rotate');
            data.append('(60) scale(19.5 19.5)\\"><stop');
            data.append(' offset=\\"0.0729167\\" stop-co');
            data.append('lor=\\"#E1B950\\"/><stop offset');
            data.append('=\\"0.244792\\" stop-color=\\"#');
            data.append('F6F3A6\\"/><stop offset=\\"0.43');
            data.append('4957\\" stop-color=\\"#F6F3A6\\');
            data.append('"/><stop offset=\\"0.494792\\"');
            data.append(' stop-color=\\"#EDCC7D\\"/><sto');
            data.append('p offset=\\"0.532623\\" stop-co');
            data.append('lor=\\"#E1B950\\"/><stop offset');
            data.append('=\\"0.593311\\" stop-color=\\"#');
            data.append('675102\\"/><stop offset=\\"0.62');
            data.append('7652\\" stop-color=\\"#675102\\');
            data.append('"/><stop offset=\\"0.708863\\"');
            data.append(' stop-color=\\"#EDCC7D\\"/><sto');
            data.append('p offset=\\"0.773898\\" stop-co');
            data.append('lor=\\"#E1B950\\"/><stop offset');
            data.append('=\\"0.921875\\" stop-color=\\"#');
            data.append('675102\\"/></radialGradient><ra');
            data.append('dialGradient id=\\"paint1_angul');
            data.append('ar_infty\\" cx=\\"0\\" cy=\\"0');
            data.append('\\" r=\\"1.7\\" gradientUnits=');
            data.append('\\"userSpaceOnUse\\" gradientTr');
            data.append('ansform=\\"translate(22.5 22.5)');
            data.append(' rotate(60) scale(19.5 19.5)\\"');
            data.append('><stop offset=\\"0.0729167\\" s');
            data.append('top-color=\\"#E1B950\\"/><stop');
            data.append(' offset=\\"0.244792\\" stop-col');
            data.append('or=\\"#F6F3A6\\"/><stop offset=');
            data.append('\\"0.434957\\" stop-color=\\"#F');
            data.append('6F3A6\\"/><stop offset=\\"0.494');
            data.append('792\\" stop-color=\\"#EDCC7D\\"');
            data.append('/><stop offset=\\"0.532623\\" s');
            data.append('top-color=\\"#E1B950\\"/><stop');
            data.append(' offset=\\"0.593311\\" stop-col');
            data.append('or=\\"#675102\\"/><stop offset=');
            data.append('\\"0.627652\\" stop-color=\\"#6');
            data.append('75102\\"/><stop offset=\\"0.708');
            data.append('863\\" stop-color=\\"#EDCC7D\\"');
            data.append('/><stop offset=\\"0.773898\\" s');
            data.append('top-color=\\"#E1B950\\"/><stop');
            data.append(' offset=\\"0.921875\\" stop-col');
            data.append('or=\\"#675102\\"/></radialGradi');
            data.append('ent></defs></svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use debug::PrintTrait;
    use traits::Into;

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
    #[available_gas(1071000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @153_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
