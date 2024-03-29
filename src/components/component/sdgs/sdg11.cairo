const NAME: felt252 = 'SDG11.svg';

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

            data.append(' id=\\"SDG11\\" xmlns=\\"http://');
            data.append('www.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.05 62.05\\"><rect fil');
            data.append('l=\\"#f99d25\\" width=\\"62.05');
            data.append('\\" height=\\"62.05\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M5.41,7.');
            data.append('73c-.11.06-.42.18-.94.37l-.77.2');
            data.append('8V6.7a9.24,9.24,0,0,0,1.2-.59,3');
            data.append('.87,3.87,0,0,0,1-.71H7.67V17.23');
            data.append('H5.41Z\\"/><path d=\\"M10.36,7.');
            data.append('73c-.11.06-.42.18-.94.37s-.66.2');
            data.append('3-.77.28V6.7a9.94,9.94,0,0,0,1.');
            data.append('21-.59,4.26,4.26,0,0,0,1-.71h1.');
            data.append('76V17.23H10.36Z\\"/><path d=\\"');
            data.append('M17.88,10a1.33,1.33,0,0,1-.69-.');
            data.append('16,1,1,0,0,1-.41-.46,2.31,2.31,');
            data.append('0,0,1-.16-.76l.71-.14a2.12,2.12');
            data.append(',0,0,0,.07.47.65.65,0,0,0,.16.3');
            data.append('1.4.4,0,0,0,.29.11.31.31,0,0,0,');
            data.append('.28-.12.5.5,0,0,0,.09-.31.8.8,0');
            data.append(',0,0-.14-.48,2,2,0,0,0-.35-.38l');
            data.append('-.57-.51a1.71,1.71,0,0,1-.39-.4');
            data.append('6,1.32,1.32,0,0,1-.14-.62,1.06,');
            data.append('1.06,0,0,1,.31-.83,1.43,1.43,0,');
            data.append('0,1,1.39-.19.82.82,0,0,1,.34.27');
            data.append(',1.17,1.17,0,0,1,.18.39,2.31,2.');
            data.append('31,0,0,1,.08.47l-.7.12a3.53,3.5');
            data.append('3,0,0,0-.05-.38.49.49,0,0,0-.13');
            data.append('-.26.4.4,0,0,0-.55,0,.44.44,0,0');
            data.append(',0-.1.3.65.65,0,0,0,.1.38,1.22,');
            data.append('1.22,0,0,0,.27.3l.56.5a2.29,2.2');
            data.append('9,0,0,1,.48.55,1.41,1.41,0,0,1,');
            data.append('.2.76,1.21,1.21,0,0,1-.14.58,1,');
            data.append('1,0,0,1-.4.39A1.15,1.15,0,0,1,1');
            data.append('7.88,10Z\\"/><path d=\\"M20.51,');
            data.append('10a1.47,1.47,0,0,1-.79-.18,1,1,');
            data.append('0,0,1-.38-.53,2.69,2.69,0,0,1-.');
            data.append('11-.81V5.39H20V8.54a2.41,2.41,0');
            data.append(',0,0,0,.4.46.46,0,0,0,.13.3.39.');
            data.append('39,0,0,0,.31.12.37.37,0,0,0,.31');
            data.append('-.12.52.52,0,0,0,.13-.3,2.41,2.');
            data.append('41,0,0,0,0-.4V5.39h.8V8.45a2.69');
            data.append(',2.69,0,0,1-.11.81.91.91,0,0,1-');
            data.append('.38.53A1.41,1.41,0,0,1,20.51,10');
            data.append('Z\\"/><path d=\\"M23.34,10a1.29');
            data.append(',1.29,0,0,1-.68-.16,1,1,0,0,1-.');
            data.append('42-.46,2.09,2.09,0,0,1-.15-.76l');
            data.append('.71-.14a2.15,2.15,0,0,0,.06.47.');
            data.append('75.75,0,0,0,.16.31.42.42,0,0,0,');
            data.append('.29.11.34.34,0,0,0,.29-.12.57.5');
            data.append('7,0,0,0,.08-.31.8.8,0,0,0-.14-.');
            data.append('48,1.53,1.53,0,0,0-.35-.38l-.57');
            data.append('-.51a1.51,1.51,0,0,1-.38-.46,1.');
            data.append('21,1.21,0,0,1-.15-.62,1.07,1.07');
            data.append(',0,0,1,.32-.83,1.16,1.16,0,0,1,');
            data.append('.85-.29,1.19,1.19,0,0,1,.53.1.8');
            data.append('2.82,0,0,1,.34.27,1.42,1.42,0,0');
            data.append(',1,.19.39,2.31,2.31,0,0,1,.07.4');
            data.append('7l-.7.12a2.06,2.06,0,0,0-.05-.3');
            data.append('8.43.43,0,0,0-.13-.26.33.33,0,0');
            data.append(',0-.27-.1.35.35,0,0,0-.28.12.49');
            data.append('.49,0,0,0-.1.3.74.74,0,0,0,.1.3');
            data.append('8,1.22,1.22,0,0,0,.27.3l.57.5a2');
            data.append('.49,2.49,0,0,1,.47.55,1.33,1.33');
            data.append(',0,0,1,.2.76,1.21,1.21,0,0,1-.1');
            data.append('4.58,1,1,0,0,1-.4.39A1.12,1.12,');
            data.append('0,0,1,23.34,10Z\\"/><path d=\\"');
            data.append('M25.18,9.91V6h-.72V5.39h2.26V6H');
            data.append('26V9.91Z\\"/><path d=\\"M26.56,');
            data.append('9.91l.91-4.52h.88l.9,4.52h-.76l');
            data.append('-.18-1h-.79l-.18,1Zm1.05-1.57h.');
            data.append('61l-.31-1.9Z\\"/><path d=\\"M29');
            data.append('.48,9.91V5.39h.81V9.91Z\\"/><pa');
            data.append('th d=\\"M30.76,9.91V5.39h.58L32');
            data.append('.44,8V5.39h.68V9.91h-.55l-1.11-');
            data.append('2.7v2.7Z\\"/><path d=\\"M33.35,');
            data.append('9.91l.9-4.52h.88L36,9.91h-.77l-');
            data.append('.18-1h-.78l-.19,1Zm1-1.57H35l-.');
            data.append('31-1.9Z\\"/><path d=\\"M36.24,9');
            data.append('.91V5.39h1.11a3.12,3.12,0,0,1,.');
            data.append('55.05,1,1,0,0,1,.41.19.92.92,0,');
            data.append('0,1,.28.36,1.46,1.46,0,0,1,.09.');
            data.append('56,1.33,1.33,0,0,1-.07.47.81.81');
            data.append(',0,0,1-.23.31.66.66,0,0,1-.36.1');
            data.append('5.85.85,0,0,1,.71.56,1.52,1.52,');
            data.append('0,0,1,.08.55,1.73,1.73,0,0,1-.0');
            data.append('8.58,1,1,0,0,1-.24.41,1,1,0,0,1');
            data.append('-.39.25,1.89,1.89,0,0,1-.56.08Z');
            data.append('m.83-2.67h.28a.8.8,0,0,0,.38-.0');
            data.append('8.37.37,0,0,0,.18-.22A1,1,0,0,0');
            data.append(',38,6.56a.65.65,0,0,0-.09-.37A.');
            data.append('37.37,0,0,0,37.64,6a1.53,1.53,0');
            data.append(',0,0-.41,0h-.16Zm0,2.09h.31a.6.');
            data.append('6,0,0,0,.51-.18A1,1,0,0,0,38,8.');
            data.append('59,1.44,1.44,0,0,0,38,8.14a.58.');
            data.append('58,0,0,0-.21-.25.77.77,0,0,0-.4');
            data.append('-.08h-.28Z\\"/><path d=\\"M39.1');
            data.append('2,9.91V5.39H40v4H41v.57Z\\"/><p');
            data.append('ath d=\\"M41.22,9.91V5.39h1.9V6');
            data.append('H42.05v1.3h.84v.58h-.84V9.34h1.');
            data.append('08v.57Z\\"/><path d=\\"M45.73,1');
            data.append('0A1.36,1.36,0,0,1,45,9.78a1,1,0');
            data.append(',0,1-.39-.54,2.26,2.26,0,0,1-.1');
            data.append('2-.77V6.85a2.36,2.36,0,0,1,.12-');
            data.append('.8A1,1,0,0,1,45,5.52a1.45,1.45,');
            data.append('0,0,1,.78-.18,1.36,1.36,0,0,1,.');
            data.append('73.16.84.84,0,0,1,.38.45,2.08,2');
            data.append('.08,0,0,1,.11.69V7h-.79V6.63c0-');
            data.append('.13,0-.24,0-.35A.41.41,0,0,0,46');
            data.append(',6a.38.38,0,0,0-.3-.09.41.41,0,');
            data.append('0,0-.31.1.49.49,0,0,0-.12.26,2.');
            data.append('13,2.13,0,0,0,0,.37v2a1.49,1.49');
            data.append(',0,0,0,0,.4.41.41,0,0,0,.14.24.');
            data.append('42.42,0,0,0,.28.08.41.41,0,0,0,');
            data.append('.3-.09A.52.52,0,0,0,46.14,9c0-.');
            data.append('11,0-.23,0-.37v-.4H47V8.6a2.17,');
            data.append('2.17,0,0,1-.1.71.93.93,0,0,1-.3');
            data.append('8.49A1.29,1.29,0,0,1,45.73,10Z');
            data.append('\\"/><path d=\\"M47.32,9.91V5.3');
            data.append('9h.82V9.91Z\\"/><path d=\\"M49.');
            data.append('06,9.91V6h-.72V5.39h2.25V6h-.71');
            data.append('V9.91Z\\"/><path d=\\"M50.8,9.9');
            data.append('1V5.39h.82V9.91Z\\"/><path d=\\');
            data.append('"M52.08,9.91V5.39H54V6H52.91v1.');
            data.append('3h.84v.58h-.84V9.34H54v.57Z\\"/');
            data.append('><path d=\\"M55.39,10a1.33,1.33');
            data.append(',0,0,1-.69-.16,1,1,0,0,1-.41-.4');
            data.append('6,2.31,2.31,0,0,1-.16-.76l.71-.');
            data.append('14a2.12,2.12,0,0,0,.07.47.65.65');
            data.append(',0,0,0,.16.31.4.4,0,0,0,.29.11.');
            data.append('31.31,0,0,0,.28-.12.5.5,0,0,0,.');
            data.append('09-.31.8.8,0,0,0-.14-.48,1.82,1');
            data.append('.82,0,0,0-.36-.38l-.56-.51a1.71');
            data.append(',1.71,0,0,1-.39-.46,1.32,1.32,0');
            data.append(',0,1-.14-.62,1.06,1.06,0,0,1,.3');
            data.append('1-.83,1.43,1.43,0,0,1,1.39-.19.');
            data.append('82.82,0,0,1,.34.27,1.17,1.17,0,');
            data.append('0,1,.18.39,2.31,2.31,0,0,1,.08.');
            data.append('47l-.7.12a3.53,3.53,0,0,0-.05-.');
            data.append('38.49.49,0,0,0-.13-.26.4.4,0,0,');
            data.append('0-.55,0,.44.44,0,0,0-.1.3.65.65');
            data.append(',0,0,0,.1.38,1.22,1.22,0,0,0,.2');
            data.append('7.3l.56.5a2.29,2.29,0,0,1,.48.5');
            data.append('5,1.41,1.41,0,0,1,.2.76,1.21,1.');
            data.append('21,0,0,1-.14.58,1,1,0,0,1-.4.39');
            data.append('A1.15,1.15,0,0,1,55.39,10Z\\"/>');
            data.append('<path d=\\"M16.51,17.3l.9-4.52h');
            data.append('.88l.91,4.52h-.77l-.17-1h-.79l-');
            data.append('.19,1Zm1-1.57h.62l-.31-1.9Z\\"/');
            data.append('><path d=\\"M19.4,17.3V12.78H20');
            data.append('l1.1,2.58V12.78h.68V17.3h-.55L2');
            data.append('0.1,14.6v2.7Z\\"/><path d=\\"M2');
            data.append('2.22,17.3V12.78h1.06a2.06,2.06,');
            data.append('0,0,1,.87.15.9.9,0,0,1,.44.46,2');
            data.append('.27,2.27,0,0,1,.13.8v1.65a2.39,');
            data.append('2.39,0,0,1-.13.82.94.94,0,0,1-.');
            data.append('44.48,1.75,1.75,0,0,1-.83.16Zm.');
            data.append('82-.57h.25a.7.7,0,0,0,.41-.1.48');
            data.append('.48,0,0,0,.15-.3,3.09,3.09,0,0,');
            data.append('0,0-.47V14.13a1.78,1.78,0,0,0,0');
            data.append('-.44.41.41,0,0,0-.16-.25.8.8,0,');
            data.append('0,0-.4-.08H23Z\\"/><path d=\\"M');
            data.append('27.44,17.36a1.36,1.36,0,0,1-.78');
            data.append('-.19,1,1,0,0,1-.39-.54,2.55,2.5');
            data.append('5,0,0,1-.11-.77V14.24a2.66,2.66');
            data.append(',0,0,1,.11-.8,1,1,0,0,1,.39-.53');
            data.append(',1.45,1.45,0,0,1,.78-.18,1.4,1.');
            data.append('4,0,0,1,.74.16.83.83,0,0,1,.37.');
            data.append('45,1.85,1.85,0,0,1,.12.69v.38h-');
            data.append('.8V14a1.94,1.94,0,0,0,0-.35.4.4');
            data.append(',0,0,0-.1-.25.41.41,0,0,0-.3-.0');
            data.append('9.4.4,0,0,0-.31.1.43.43,0,0,0-.');
            data.append('13.26,2.12,2.12,0,0,0,0,.37v2a2');
            data.append('.17,2.17,0,0,0,0,.4.42.42,0,0,0');
            data.append(',.15.24.41.41,0,0,0,.28.08.39.3');
            data.append('9,0,0,0,.29-.09.44.44,0,0,0,.11');
            data.append('-.26,2.12,2.12,0,0,0,0-.37v-.4h');
            data.append('.8V16a2.2,2.2,0,0,1-.11.71.91.9');
            data.append('1,0,0,1-.37.49A1.44,1.44,0,0,1,');
            data.append('27.44,17.36Z\\"/><path d=\\"M30');
            data.append('.24,17.36a1.4,1.4,0,0,1-.76-.18');
            data.append(',1,1,0,0,1-.41-.51,2.34,2.34,0,');
            data.append('0,1-.12-.79V14.19a2.3,2.3,0,0,1');
            data.append(',.12-.79,1,1,0,0,1,.41-.5,1.5,1');
            data.append('.5,0,0,1,.76-.17,1.56,1.56,0,0,');
            data.append('1,.78.17,1,1,0,0,1,.4.5,2.08,2.');
            data.append('08,0,0,1,.13.79v1.69a2.11,2.11,');
            data.append('0,0,1-.13.79,1,1,0,0,1-.4.51A1.');
            data.append('45,1.45,0,0,1,30.24,17.36Zm0-.6');
            data.append('1a.52.52,0,0,0,.31-.08.59.59,0,');
            data.append('0,0,.13-.25,1.79,1.79,0,0,0,0-.');
            data.append('34V14a1.9,1.9,0,0,0,0-.35.52.52');
            data.append(',0,0,0-.13-.23.46.46,0,0,0-.31-');
            data.append('.09.4.4,0,0,0-.29.09.39.39,0,0,');
            data.append('0-.14.23,1.9,1.9,0,0,0,0,.35v2.');
            data.append('08a1.79,1.79,0,0,0,0,.34.43.43,');
            data.append('0,0,0,.13.25A.51.51,0,0,0,30.24');
            data.append(',16.75Z\\"/><path d=\\"M31.92,1');
            data.append('7.3,32,12.78h.85l.64,3.13.67-3.');
            data.append('13H35l.08,4.52h-.61l-.07-3.14-.');
            data.append('64,3.14h-.5l-.65-3.15-.06,3.15Z');
            data.append('\\"/><path d=\\"M35.5,17.3l.08-');
            data.append('4.52h.86l.64,3.13.67-3.13h.82l.');
            data.append('09,4.52H38L38,14.16l-.65,3.14h-');
            data.append('.49l-.66-3.15-.06,3.15Z\\"/><pa');
            data.append('th d=\\"M40.34,17.36a1.41,1.41,');
            data.append('0,0,1-.78-.18.92.92,0,0,1-.39-.');
            data.append('53,2.71,2.71,0,0,1-.1-.81V12.78');
            data.append('h.8v3.15a2.41,2.41,0,0,0,0,.4.5');
            data.append('2.52,0,0,0,.13.3.39.39,0,0,0,.3');
            data.append('1.12.37.37,0,0,0,.31-.12.52.52,');
            data.append('0,0,0,.13-.3,2.41,2.41,0,0,0,0-');
            data.append('.4V12.78h.8v3.06a2.71,2.71,0,0,');
            data.append('1-.1.81.92.92,0,0,1-.39.53A1.41');
            data.append(',1.41,0,0,1,40.34,17.36Z\\"/><p');
            data.append('ath d=\\"M42,17.3V12.78h.58l1.1');
            data.append(',2.58V12.78h.68V17.3h-.55l-1.1-');
            data.append('2.7v2.7Z\\"/><path d=\\"M44.87,');
            data.append('17.3V12.78h.81V17.3Z\\"/><path');
            data.append(' d=\\"M46.61,17.3V13.39h-.72v-.');
            data.append('61h2.25v.61h-.71V17.3Z\\"/><pat');
            data.append('h d=\\"M48.35,17.3V12.78h.81V17');
            data.append('.3Z\\"/><path d=\\"M49.63,17.3V');
            data.append('12.78h1.9v.58H50.46v1.3h.84v.58');
            data.append('h-.84v1.49h1.08v.57Z\\"/><path');
            data.append(' d=\\"M52.93,17.36a1.29,1.29,0,');
            data.append('0,1-.68-.16,1,1,0,0,1-.41-.46,2');
            data.append('.09,2.09,0,0,1-.16-.76l.71-.14a');
            data.append('2.12,2.12,0,0,0,.07.47.65.65,0,');
            data.append('0,0,.16.31.4.4,0,0,0,.29.11.32.');
            data.append('32,0,0,0,.28-.12.49.49,0,0,0,.0');
            data.append('8-.31.78.78,0,0,0-.13-.48,1.82,');
            data.append('1.82,0,0,0-.36-.38l-.57-.51a1.6');
            data.append('7,1.67,0,0,1-.38-.46,1.33,1.33,');
            data.append('0,0,1-.14-.63A1.06,1.06,0,0,1,5');
            data.append('2,13a1.18,1.18,0,0,1,.86-.29,1.');
            data.append('22,1.22,0,0,1,.53.1.73.73,0,0,1');
            data.append(',.33.27,1,1,0,0,1,.19.39A2.31,2');
            data.append('.31,0,0,1,54,14l-.7.12a3.53,3.5');
            data.append('3,0,0,0,0-.38.58.58,0,0,0-.13-.');
            data.append('26.4.4,0,0,0-.55,0,.44.44,0,0,0');
            data.append('-.1.3.74.74,0,0,0,.09.38,1.54,1');
            data.append('.54,0,0,0,.28.3l.56.5a2.29,2.29');
            data.append(',0,0,1,.48.55,1.41,1.41,0,0,1,.');
            data.append('2.76,1.21,1.21,0,0,1-.14.58,1.0');
            data.append('7,1.07,0,0,1-.4.39A1.16,1.16,0,');
            data.append('0,1,52.93,17.36Z\\"/><path d=\\');
            data.append('"M10.58,47.32H20a.23.23,0,0,0,.');
            data.append('23-.24.28.28,0,0,0-.06-.15h0l-4');
            data.append('.67-6,0-.05a.23.23,0,0,0-.32,0l');
            data.append('0,0-.05,0-4.55,6-.07.09a.25.25,');
            data.append('0,0,0,0,.12A.23.23,0,0,0,10.58,');
            data.append('47.32Z\\"/><path d=\\"M19.93,48');
            data.append('.17H10.54a.23.23,0,0,0-.23.23v7');
            data.append('.35a.23.23,0,0,0,.23.23h3V51.35');
            data.append('a.23.23,0,0,1,.23-.23H16.6a.24.');
            data.append('24,0,0,1,.23.23V56h3.1a.23.23,0');
            data.append(',0,0,.23-.23V48.4A.23.23,0,0,0,');
            data.append('19.93,48.17Z\\"/><path d=\\"M52');
            data.append('.4,46.24H43.1a.22.22,0,0,0-.22.');
            data.append('22v9.39a.22.22,0,0,0,.22.22h9.3');
            data.append('a.22.22,0,0,0,.23-.22V46.46a.22');
            data.append('.22,0,0,0-.23-.22m-5.09,6.13a.2');
            data.append('2.22,0,0,1-.22.22H44.31a.22.22,');
            data.append('0,0,1-.23-.22V50.68a.22.22,0,0,');
            data.append('1,.23-.22h2.78a.22.22,0,0,1,.22');
            data.append('.22Zm0-3.12a.22.22,0,0,1-.22.22');
            data.append('H44.31a.22.22,0,0,1-.23-.22V47.');
            data.append('56a.22.22,0,0,1,.23-.22h2.78a.2');
            data.append('2.22,0,0,1,.22.22Zm4.25,3.12a.2');
            data.append('2.22,0,0,1-.23.22H48.55a.22.22,');
            data.append('0,0,1-.22-.22V50.68a.22.22,0,0,');
            data.append('1,.22-.22h2.78a.22.22,0,0,1,.23');
            data.append('.22Zm0-3.12a.22.22,0,0,1-.23.22');
            data.append('H48.55a.22.22,0,0,1-.22-.22V47.');
            data.append('56a.22.22,0,0,1,.22-.22h2.78a.2');
            data.append('2.22,0,0,1,.23.22Z\\"/><path d=');
            data.append('\\"M30.79,24.45h-9.1a.22.22,0,0');
            data.append(',0-.23.22v31.1a.22.22,0,0,0,.23');
            data.append('.22h9.1a.22.22,0,0,0,.22-.22V24');
            data.append('.67a.22.22,0,0,0-.22-.22m-5.42,');
            data.append('28a.12.12,0,0,1-.12.12H23.17a.1');
            data.append('2.12,0,0,1-.12-.12V50.13a.12.12');
            data.append(',0,0,1,.12-.12h2.08a.12.12,0,0,');
            data.append('1,.12.12Zm0-5.33a.12.12,0,0,1-.');
            data.append('12.12H23.17a.12.12,0,0,1-.12-.1');
            data.append('2V44.79a.11.11,0,0,1,.12-.11h2.');
            data.append('08a.11.11,0,0,1,.12.11Zm0-5.34a');
            data.append('.12.12,0,0,1-.12.12H23.17a.12.1');
            data.append('2,0,0,1-.12-.12V39.46a.12.12,0,');
            data.append('0,1,.12-.12h2.08a.12.12,0,0,1,.');
            data.append('12.12Zm0-5.33a.12.12,0,0,1-.12.');
            data.append('12H23.17a.12.12,0,0,1-.12-.12V3');
            data.append('4.13a.12.12,0,0,1,.12-.12h2.08a');
            data.append('.12.12,0,0,1,.12.12Zm0-5.33a.12');
            data.append('.12,0,0,1-.12.12H23.17a.12.12,0');
            data.append(',0,1-.12-.12V28.8a.12.12,0,0,1,');
            data.append('.12-.12h2.08a.12.12,0,0,1,.12.1');
            data.append('2Zm4.09,21.33a.13.13,0,0,1-.12.');
            data.append('12H27.26a.12.12,0,0,1-.12-.12V5');
            data.append('0.13a.12.12,0,0,1,.12-.12h2.08a');
            data.append('.12.12,0,0,1,.12.12Zm0-5.33a.13');
            data.append('.13,0,0,1-.12.12H27.26a.12.12,0');
            data.append(',0,1-.12-.12V44.79a.11.11,0,0,1');
            data.append(',.12-.11h2.08a.12.12,0,0,1,.12.');
            data.append('11Zm0-5.34a.12.12,0,0,1-.12.12H');
            data.append('27.26a.12.12,0,0,1-.12-.12V39.4');
            data.append('6a.12.12,0,0,1,.12-.12h2.08a.13');
            data.append('.13,0,0,1,.12.12Zm0-5.33a.12.12');
            data.append(',0,0,1-.12.12H27.26a.12.12,0,0,');
            data.append('1-.12-.12V34.13a.12.12,0,0,1,.1');
            data.append('2-.12h2.08a.12.12,0,0,1,.12.12Z');
            data.append('m0-5.33a.13.13,0,0,1-.12.12H27.');
            data.append('26a.12.12,0,0,1-.12-.12V28.8a.1');
            data.append('2.12,0,0,1,.12-.12h2.08a.12.12,');
            data.append('0,0,1,.12.12Z\\"/><rect x=\\"42');
            data.append('.89\\" y=\\"43.24\\" width=\\"9');
            data.append('.73\\" height=\\"2.25\\" rx=\\"');
            data.append('0.19\\"/><path d=\\"M41.78,30.3');
            data.append('2a.25.25,0,0,0-.23-.18.21.21,0,');
            data.append('0,0-.13.05h0l-.07.1L32.38,41.64');
            data.append('l0,.06a.21.21,0,0,0-.08.17v14a.');
            data.append('22.22,0,0,0,.23.22h9.09a.22.22,');
            data.append('0,0,0,.22-.22V30.41A.29.29,0,0,');
            data.append('0,41.78,30.32ZM38,36.48l.07-.08');
            data.append('c.61-.79,1.64-2,2.14-2.67l.07-.');
            data.append('08a.25.25,0,0,1,.2-.09.27.27,0,');
            data.append('0,1,.25.2v2.87a.26.26,0,0,1-.25');
            data.append('.26H38.21a.26.26,0,0,1-.25-.26A');
            data.append('.27.27,0,0,1,38,36.48ZM36.6,52.');
            data.append('37a.22.22,0,0,1-.23.22H33.66a.2');
            data.append('2.22,0,0,1-.22-.22v-1.7a.22.22,');
            data.append('0,0,1,.22-.22h2.71a.22.22,0,0,1');
            data.append(',.23.22Zm0-3.14a.23.23,0,0,1-.2');
            data.append('3.23H33.66a.22.22,0,0,1-.22-.23');
            data.append('V47.54a.22.22,0,0,1,.22-.23h2.7');
            data.append('1a.23.23,0,0,1,.23.23Zm0-3.13a.');
            data.append('22.22,0,0,1-.23.22H33.66a.22.22');
            data.append(',0,0,1-.22-.22V44.4a.22.22,0,0,');
            data.append('1,.22-.22h2.71a.22.22,0,0,1,.23');
            data.append('.22Zm0-6.88V43a.22.22,0,0,1-.22');
            data.append('.22H33.67a.22.22,0,0,1-.22-.22v');
            data.append('-.47a.19.19,0,0,1,0-.08l0,0s0,0');
            data.append(',0,0l0,0c.35-.5,1.91-2.43,2.57-');
            data.append('3.23l.07-.08a.25.25,0,0,1,.44.1');
            data.append('1Zm4.14,13.15a.22.22,0,0,1-.22.');
            data.append('22H37.81a.22.22,0,0,1-.22-.22v-');
            data.append('1.7a.22.22,0,0,1,.22-.22h2.71a.');
            data.append('22.22,0,0,1,.22.22Zm0-3.14a.22.');
            data.append('22,0,0,1-.22.23H37.81a.22.22,0,');
            data.append('0,1-.22-.23V47.54a.22.22,0,0,1,');
            data.append('.22-.23h2.71a.22.22,0,0,1,.22.2');
            data.append('3Zm0-3.13a.22.22,0,0,1-.22.22H3');
            data.append('7.81a.22.22,0,0,1-.22-.22V44.4a');
            data.append('.21.21,0,0,1,.22-.22h2.71a.22.2');
            data.append('2,0,0,1,.22.22Zm0-3.14a.22.22,0');
            data.append(',0,1-.22.22H37.81a.22.22,0,0,1-');
            data.append('.22-.22v-1.7a.22.22,0,0,1,.22-.');
            data.append('22h2.71a.22.22,0,0,1,.22.22Zm0-');
            data.append('3.14a.22.22,0,0,1-.22.22H37.81a');
            data.append('.22.22,0,0,1-.22-.22v-1.7a.22.2');
            data.append('2,0,0,1,.22-.22h2.71a.22.22,0,0');
            data.append(',1,.22.22Z\\"/></g></svg>');

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
    #[available_gas(2555000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @365_u32, 'Couldn\'t get data');
    }
}
