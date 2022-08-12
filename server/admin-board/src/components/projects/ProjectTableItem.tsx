import {
  Button,
  IconButton,
  Input,
  InputGroup,
  InputRightElement,
  Link,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalOverlay,
  Select,
  Td,
  Text,
  Tr,
  useClipboard,
  useDisclosure,
} from "@chakra-ui/react";
import React, { useEffect, useState } from "react";
import { AiOutlineLink } from "react-icons/ai";
import { getInvite } from "../../lib/api/axios";
import { Project } from "../../lib/api/dto/ProjectResponse";
import { formatDate } from "../../lib/utils/dateUtils";

interface TableItemProps {
  project: Project;
}

export const ProjectTableItem: React.FC<TableItemProps> = ({ project }) => {
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [inviteLink, setInviteLink] = useState("");
  const [expirationDate, setExpirationDate] = useState("OneDay");
  const { hasCopied, onCopy } = useClipboard(inviteLink);

  useEffect(() => {
    if (isOpen) {
      const fetchLink = async (): Promise<void> => {
        try {
          const { data } = await getInvite(project.id, expirationDate);
          if (data) setInviteLink(data.value);
        } catch (err) {}
      };
      fetchLink();
    }
  }, [isOpen, setInviteLink, project, expirationDate]);

  return (
    <>
      <Tr _hover={{ bg: "borderGray" }}>
        <Td>{project.id}</Td>
        <Td>
          <Link
            fontWeight="semibold"
            href={`/dashboard/projects/${project.id}`}
            _focus={{ outline: "none" }}
          >
            {project.name}
          </Link>
        </Td>
        <Td>
          <Text>{formatDate(project.createdAt)}</Text>
        </Td>
        <Td>{project.scenarioCount}</Td>
        <Td>
          <IconButton
            aria-label="Invite"
            icon={<AiOutlineLink />}
            onClick={onOpen}
          />
        </Td>
      </Tr>
      <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
          <ModalHeader>Invite for '{project.name}'</ModalHeader>
          <ModalCloseButton />
          <ModalBody>
            <Text mb="2">
              Share this token with others to grant access to this project.
            </Text>

            <InputGroup>
              <Input id="invite-link" value={inviteLink} isReadOnly />
              <InputRightElement width="4.5rem">
                <Button h="1.75rem" size="sm" type="submit" onClick={onCopy}>
                  {hasCopied ? "Copied" : "Copy"}
                </Button>
              </InputRightElement>
            </InputGroup>

            <Text my="3">
              Set the token expiration time (defaults to one day)
            </Text>
            <Select
              placeholder="Select Expiration"
              my="2"
              onChange={(option) => setExpirationDate(option.target.value)}
            >
              <option value="ThirtyMinutes">30 Minutes</option>
              <option value="OneHour">1 Hour</option>
              <option value="SixHours">6 Hours</option>
              <option value="TwelveHours">12 Hours</option>
              <option value="OneDay">1 Day</option>
              <option value="SevenDays">7 Days</option>
              on
            </Select>
          </ModalBody>

          <ModalFooter></ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};
