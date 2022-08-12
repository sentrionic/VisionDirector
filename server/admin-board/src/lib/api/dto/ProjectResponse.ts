export interface Project {
  id: string;
  name: string;
  createdAt: string;
  scenarioCount: string;
  collaborators: Collaborator[];
}

export interface Collaborator {
  id: string;
  username: string;
  email: string;
}
