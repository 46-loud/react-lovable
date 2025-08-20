import { useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';

const NotFound = () => {
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    console.error(
      '404 Error: User attempted to access non-existent route:',
      location.pathname,
    );
  }, [location.pathname]);

  return (
    <div className="min-h-screen flex flex-col items-center justify-center container-custom py-12 md:py-16 lg:py-20 space-y-4 text-center">
      <h1 className="text-4xl sm:text-5xl md:text-6xl font-bold text-foreground">
        404
      </h1>

      <p className="text-base sm:text-lg md:text-xl text-muted-foreground max-w-md">
        Oops! La página que buscas no existe o ha sido movida.
      </p>
    </div>
  );
};

export default NotFound;
