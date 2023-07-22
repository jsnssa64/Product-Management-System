import styled from 'styled-components';

const StyledButton = styled.button`
  background-color: ${(props) => props.theme.primaryColor};
  color: ${(props) => props.theme.textColor};
  padding: 1rem;
  border: none;
  cursor: pointer;
  font-size: 1rem;

  &:hover {
    background-color: ${(props) => props.theme.secondaryColor};
  }
`;

export default StyledButton;