import { Td, Text, Tr } from '@chakra-ui/react';
import React from 'react';
import { User } from '../../lib/api/dto/UserResponse';

interface TableItemProps {
  user: User;
}

export const UserTableItem: React.FC<TableItemProps> = ({ user }) => {
  return (
    <>
      <Tr _hover={{ bg: 'borderGray' }}>
        <Td>{user.id}</Td>
        <Td>{user.email}</Td>
        <Td>
          <Text>{user.username}</Text>
        </Td>
        <Td>{user.role}</Td>
      </Tr>
    </>
  );
};
