import styled from "styled-components";

export const BodyStyle = styled.div`
    padding-top:41px;
    width: 100%;
    height: 100vh;
    max-width: 1366px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin: auto;
    @media screen and (max-width: 768px) {
        padding: 2rem;
    }

`

export const DivStyle = styled.div`
    background-color: #fff;
    box-shadow: 1px 2px 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    width: 50%;
    height: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 1rem;
    @media screen and (max-width: 768px) {
      width: 100%;
    }
`;

export const ButtonStyle = styled.button`
  position: absolute;
  background: #1dbeb4;
  border-radius: 5px;
`;

export const ImageStyle = styled.img`
  margin-bottom: 1rem;
  height: 3.7rem;
  width: 4rem;
`;

export const H2Style = styled.h2`
  font-weight: 700;
  font-size: 24px;
  line-height: 28px;
  color: #1dbeb4;
  padding-bottom:10px;

@media (max-width: 414px) {
    top: 39.67%;
    bottom: 43%;
    font-size: 20px;
    line-height: 23px;
}
`;

export const H3Style = styled.h3`
align-self:center;
  padding-bottom:30px;
  font-weight: 700;
  font-size: 19px;
  line-height: 23px;
  display: flex;
  align-items: flex-end;
  text-align: center;
  color: #383b58;


@media (max-width: 414px) {
    top: 55.33%;
    bottom: 35%;
    font-size: 16px;
line-height: 19px;
}
`;

