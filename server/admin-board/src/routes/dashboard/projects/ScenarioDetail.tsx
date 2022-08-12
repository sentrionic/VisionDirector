import {
  Box,
  Flex,
  Heading,
  Link,
  Table,
  Tbody,
  Td,
  Tfoot,
  Th,
  Thead,
  Tr,
} from "@chakra-ui/react";
import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { DashboardWrapper } from "../../../components/common/DashboardWrapper";
import { getSteps } from "../../../lib/api/axios";
import { formatDate } from "../../../lib/utils/dateUtils";

const StepTableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Position</Th>
      <Th>Name</Th>
      <Th>Creation</Th>
      <Th>Last Updated</Th>
      <Th>File</Th>
      <Th>Duration (s)</Th>
    </Tr>
  );
};

export const ScenarioDetail = (): JSX.Element => {
  const { scenarioId } = useParams();

  const { data } = useQuery(["sKey"], async () => {
    const response = await getSteps(scenarioId!);
    return response.data;
  });

  if (!data) return <Box />;

  return (
    <DashboardWrapper>
      <Flex
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
        align={"center"}
        mb="4"
      >
        <Heading>Scenario: {scenarioId}</Heading>
      </Flex>
      <Heading ml="2" mb="4">
        Steps
      </Heading>
      <Box
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
      >
        <Table variant="simple">
          <Thead>
            <StepTableInfo />
          </Thead>
          <Tbody>
            {data?.map((s) => (
              <Tr _hover={{ bg: "borderGray" }} key={s.id}>
                <Td>{s.id}</Td>
                <Td>#{s.position}</Td>
                <Td>{s.name}</Td>
                <Td>{formatDate(s.createdAt)}</Td>
                <Td>{formatDate(s.updatedAt)}</Td>
                <Td>
                  <Link onClick={() => window.open(s.media?.fileUrl, "_blank")}>
                    {s.media?.fileName}
                  </Link>
                </Td>
                <Td>{s.duration}</Td>
              </Tr>
            ))}
          </Tbody>
          <Tfoot>
            <StepTableInfo />
          </Tfoot>
        </Table>
      </Box>
    </DashboardWrapper>
  );
};
