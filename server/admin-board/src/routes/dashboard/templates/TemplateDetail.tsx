import {
  Box,
  Button,
  Flex,
  Heading,
  IconButton,
  Link,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalOverlay,
  Table,
  Tbody,
  Td,
  Text,
  Tfoot,
  Th,
  Thead,
  Tr,
  useDisclosure,
} from "@chakra-ui/react";
import { useQuery } from "@tanstack/react-query";
import { useState } from "react";
import { AiOutlineDelete } from "react-icons/ai";
import { useNavigate, useParams } from "react-router-dom";
import { DashboardWrapper } from "../../../components/common/DashboardWrapper";
import { deleteTemplateStep, getTemplates } from "../../../lib/api/axios";
import { TemplateStep } from "../../../lib/api/dto/TemplateResponse";

const StepTableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Position</Th>
      <Th>Name</Th>
      <Th>Duration (s)</Th>
      <Th>Action</Th>
    </Tr>
  );
};

export const TemplateDetail = (): JSX.Element => {
  const { templateId } = useParams();
  const navigate = useNavigate();

  const key = "tKey";

  const { data } = useQuery([key], async () => {
    const response = await getTemplates();
    return response.data;
  });

  if (!data) return <Box />;

  const template = data.find((e) => e.id === templateId);

  if (!template) return <Box />;

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
        justify={"space-between"}
      >
        <Heading>Template: {template.name}</Heading>
        <Button
          variant={"outline"}
          colorScheme={"blue"}
          onClick={() => navigate(`/dashboard/templates/${template.id}/edit`)}
        >
          Edit
        </Button>
      </Flex>
      <Flex
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
        align={"center"}
        mb="4"
      >
        <Text fontSize={"lg"}>{template.description}</Text>
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
            {template.steps.map((s) => (
              <StepTableItem step={s} key={s.id} templateId={template.id} />
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

const StepTableItem: React.FC<{ step: TemplateStep; templateId: string }> = ({
  step,
  templateId,
}) => {
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [showError, toggleShow] = useState(false);
  const navigate = useNavigate();

  const handleDelete = async (): Promise<void> => {
    try {
      const { data } = await deleteTemplateStep(templateId, step.id);
      if (data) {
        navigate(0);
        onClose();
      }
    } catch (err) {
      toggleShow(true);
    }
  };

  return (
    <>
      <Tr _hover={{ bg: "borderGray" }}>
        <Td>{step.id}</Td>
        <Td>#{step.position + 1}</Td>
        <Td>{step.name}</Td>
        <Td>{step.duration}</Td>
        <Td>
          <Link onClick={() => window.open(step.media?.fileUrl, "_blank")}>
            {step.media?.fileUrl}
          </Link>
        </Td>
        <Td>
          <IconButton
            aria-label="Invite"
            icon={<AiOutlineDelete />}
            onClick={onOpen}
            colorScheme="red"
          />
        </Td>
      </Tr>
      <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
          <ModalHeader>Delete '{step.name}'</ModalHeader>
          <ModalCloseButton />
          <ModalBody>
            <Text mb="2">
              Are you sure you want to delete this step? This cannot be undone.
            </Text>
            {showError && (
              <Text my="2" color="red" align="center">
                Server Error. Please try again later.
              </Text>
            )}
          </ModalBody>

          <ModalFooter>
            <Button variant="outline" mr={3} onClick={onClose}>
              Close
            </Button>
            <Button colorScheme="red" onClick={() => handleDelete()}>
              Delete
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};
